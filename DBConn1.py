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

def count_tags(userId):
	tag_dict = {}
	try:
		cxn = connect()	
	except Exception as e:
		print("Fail", e)
	cur = cxn.cursor()
	cur.execute("SELECT Id,PostTypeId,ParentId,Tags FROM Posts where OwnerUserId = %d" % userId)
	post_tuples = cur.fetchall()
	
	for post in post_tuples:

		if post[1] == 2:
			cur.execute("SELECT Tags FROM Posts where Id = %d" % post[2])
			tag_str = cur.fetchone()
			tag_list = split_String(tag_str[0])
		elif post[1] == 1:
			tag_list = split_String(post[3])
		else:
			continue
		
		for tag in tag_list:
			if tag_dict.get(tag) == None:
				tag_dict[tag] = 1
			else:
				tag_dict[tag] += 1
	
	tag_dict = sorted(tag_dict.iteritems(),key  = lambda d:d[1],reverse = True)
	cur.close()
	cxn.commit()
	cxn.close()
	return tag_dict

def insert_table(userId):
	try:
		cxn = connect()	
	except Exception as e:
		print("Fail", e)
	user_tag_list = count_tags(userId)
	cur = cxn.cursor()
	for item in user_tag_list:
		rowcount = cur.execute("insert into UserTag (UserId,Tag,Count) values (%d,'%s',%d)" % (userId,item[0],item[1]))
	cur.close()
	cxn.commit()
	cxn.close() 

def batch_insert(userId):
	batch_list = []
	counts = 0
	sql = "insert into UserTag (UserId,Tag,Count) values (%d,'%s',%d)"
	try:
		cxn = connect()	
	except Exception as e:
		print("Fail", e)
	cur = cxn.cursor()
	user_tag_list = count_tags(userId)
	for item in user_tag_list:
		
		batch_list.append([userId,item[0],item[1]])
		
			
		if len(batch_list) == 1000:
			#sql = "insert into UserTag (UserId,Tag,Count) values %s" % ','.join(batch_list)
			#cur.execute(sql)
			cur.executemany(sql,batch_list)
			cxn.commit()
			counts += len(batch_list)
			batch_list = []
			print("inserted:" + str(counts))
	cur.executemany(sql,batch_list)
	cxn.commit()
	print("FINALLY inserted:" + str(len(batch_list)+counts))
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
	cur.execute("SELECT Id FROM Users where Reputation>13")
	uid_list = cur.fetchall()
	cur.close()
	cxn.commit()
	cxn.close() 
	for uid in uid_list:
		batch_insert(uid)
	print("sucess")
	
if __name__ == '__main__':
	main()
