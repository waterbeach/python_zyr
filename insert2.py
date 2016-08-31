#!/usr/bin/python
#encoding:utf-8
import re
def connect():
	try:
		import pymysql
	except ImportError, e:
		return None
	cxn = pymysql.connect(user='root',passwd='NUDTpdl@',host='localhost',db='ow2')
	return cxn

def insert(userId,table_name):
	
	try:
		cxn = connect()	
	except Exception as e:
		print("Fail", e)
	cur = cxn.cursor()

	cur.execute("show tables")
	tables = cur.fetchall()
	createTableSql = "CREATE TABLE "+ table_name +"(`Id` int(11) NOT NULL AUTO_INCREMENT,`UserId` int(11) DEFAULT NULL,"+"`PostId` int(11) DEFAULT NULL,`Tag` varchar(255) DEFAULT NULL,`UpdateTime` datetime DEFAULT NULL,PRIMARY KEY (`Id`),"+"UNIQUE KEY `user_post_tag` (`UserId`,`PostId`,`Tag`)) ENGINE=MyISAM AUTO_INCREMENT=7670230 DEFAULT CHARSET=utf8"
	if table_name not in tables:
		try:
			cur.execute(createTableSql)
		except Exception as e:
			print("Fail create table"+table_name, e)

	cur.execute("SELECT Id,PostTypeId,ParentId,Tags,CreationDate FROM Posts where OwnerUserId = %d" % userId)
	post_tuples = cur.fetchall()
	#user's all post loop:  
	batch_list = []
	counts = 0
	sql = "insert into "+table_name+" (UserId,PostId,Tag,UpdateTime) values(%s,%s,%s,%s)"
	for post in post_tuples:
		if post[1] == 2:
			cur.execute("SELECT Tags FROM Posts where Id = %d" % post[2])
			tag_str = cur.fetchone()
			tag_list = split_String(tag_str[0])
		elif post[1] == 1:
			tag_list = split_String(post[3])
		else:
			continue
		for tag in list(set(tag_list)):
			batch_list.append([userId,post[0],tag,post[4]])
			if len(batch_list) == 500:
				#sql = "insert into UserTag (UserId,Tag,Count) values %s" % ','.join(batch_list)
				#cur.execute(sql)
				cur.executemany(sql,batch_list)
				cxn.commit()
				counts += len(batch_list)
				batch_list = []
	#sql = "insert into UserTag (UserId,Tag,Count) values %s" % ','.join(batch_list)
	#cur.execute(sql)
	cur.executemany(sql,batch_list)
	cxn.commit()
	print(str(userId[0])+" inserted:" + str(len(batch_list)+counts))
	cur.close()
	cxn.commit()
	cxn.close()


def split_String(astr):
	#astr="<.net><regex><text><formatting>"
	if astr == None:
		return None
	a=re.split('\<|\>',astr)
	b=list(filter(not_empty,a))
	return b

def not_empty(s):
	return s and s.strip()

def main():
	try:
		cxn = connect()
	except Exception as e:
		print("Fail", e)
	cur = cxn.cursor()
	cur.execute("SELECT Id FROM Users")
	uid_list = list(cur.fetchall())
	cur.close()
	cxn.commit()
	cxn.close() 

	a = uid_list.index((84278,))
	for uid in uid_list[a:]:
		table_num = uid[0]/350000 + 1;
		table_name = 'UserTags_'+str(table_num)
		insert(uid,table_name)
	
if __name__ == '__main__':
	main()
