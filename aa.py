#!/usr/bin/python
#encoding:utf-8
import re
def connect():
	try:
		import pymysql
	except Exception as e:
		print("Fail", e)
	cxn = pymysql.connect(user='root',passwd='123456',host='localhost',db='ow2')
	return cxn


def insert(uid_list):
	
	try:
		cxn = connect()	
	except Exception as e:
		print("Fail", e)
	cur = cxn.cursor()

	batch_list = []
	for uid in uid_list:
		userId = uid[0]
		tag_list = []
		tmp_list = []
		tags_str = ""
		counts = 0
		sql = "insert into userTags (UserId,AllTags) values(%s,%s)"

		cur.execute("SELECT Id,PostTypeId,ParentId,Tags FROM Posts where OwnerUserId = %d" % userId)
		post_tuples = cur.fetchall()

		#对于某个用户的所有post
		for post in post_tuples:
			tmp_list = []
			if post[1] == 2:
				cur.execute("SELECT Tags FROM Posts where Id = %d" % post[2])
				tag_str = cur.fetchone()
				tmp_list=split_String(tag_str[0])
				#print(tmp_list)
			elif post[1] == 1:
				tmp_list=split_String(post[3])
				#print(tmp_list)
			else:
				continue
			for i in tmp_list:
				tag_list.append(i)

		tag_list = list(set(tag_list))
		tags_str = ','.join(tag_list)
		#print(tags_str)
		batch_list.append([userId,"<"+tags_str+">"])
		if len(batch_list) == 500:
			cur.executemany(sql,batch_list)
			cxn.commit()
			counts += len(batch_list)
			batch_list = []
			print("have inserted:" + str(counts))
	cur.executemany(sql,batch_list)
	cxn.commit()
			
	print("have inserted:" + str(len(batch_list)+counts))	
	print("success")
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
	cur.execute("SELECT Id FROM Users where Reputation >13")
	uid_list = list(cur.fetchall())
	cur.close()
	cxn.commit()
	cxn.close()
	
	insert(uid_list)
	
if __name__ == '__main__':
	main()


