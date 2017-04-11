#!/usr/bin/python
#encoding:utf-8
import re
def connect():
	try:
		import pymysql
	except Exception as e:
		print("Fail", e)
	cxn = pymysql.connect(user='root',passwd='123456',host='localhost',db='ossean_production')
	return cxn

def splitGatherPrjIds(prjIdsStr):
	if prjIdsStr == None:
		return None
	a=re.split('\,',prjIdsStr)
	b=list(filter(not_empty,a))
	return b

def not_empty(s):
	return s and s.strip()
def dealRelation():
	try:
		cxn = connect()
	except Exception as e:
		print("Fail", e)
	cur = cxn.cursor()
	sql = "select distinct gather_projects_ids from edd_relations"
	sql1 = "select id from gather_projects"
	count = 0;
	cur.execute(sql)
	relationList = cur.fetchall()
	cur.execute(sql1)
	idList = []
	for rel in relationList:
		
		prjIdList = splitGatherPrjIds(rel[0])
		
		count += len(prjIdList)
		for id in prjIdList:
			if id in idList:
				print(id)
		idList.extend(prjIdList)
		if count % 10000 == 0:
			print("we have deal %d relation entrys!!!"% count)

	print("we have done all!!!")
	print(count)
	cur.close()
	cxn.commit()
	cxn.close()

def main():
	#str = ",100,772377,"
	#l = splitGatherPrjIds(str)
	print("begin deal!")
	dealRelation()
	print("success!")

if __name__ == '__main__':
	main()

