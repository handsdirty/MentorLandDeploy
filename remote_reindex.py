import os
import sys
import time
import string
import random
import re

if __name__=='__main__':
        #fin = open('nodelist.txt','r')
	#nodes = fin.read().split('\n')
	nodes = [   "ec2-54-219-5-76.us-west-1.compute.amazonaws.com",
				"ec2-54-241-67-96.us-west-1.compute.amazonaws.com",
				"ec2-50-18-43-219.us-west-1.compute.amazonaws.com",
				"ec2-184-72-26-243.us-west-1.compute.amazonaws.com",
				"ec2-54-219-21-236.us-west-1.compute.amazonaws.com",
				"ec2-204-236-189-129.us-west-1.compute.amazonaws.com",
				"ec2-204-236-166-137.us-west-1.compute.amazonaws.com",
				"ec2-54-219-81-125.us-west-1.compute.amazonaws.com"]
	keyfile = "/Users/zhe-mac/Code/MentorLandDeploy/mentorland_california.pem"
	for node in nodes[:1]:
		os.system('ssh -i ' + keyfile + ' ubuntu@' + node
			+ ' sh /home/ubuntu/current/start_prepare.sh')
		# stop_cleanup.sh
	'''
	for i in range(1, 6+1):
		#os.system('ssh -i ' + node2key[nodes[i]] + ' ubuntu@' + nodes[i] + ' python /home/ubuntu/HandsDirty/helloworld.py &')
		#os.system('scp -i ' + node2key[nodes[i]] + ' ~/HandsDirty/keyfiles/helloworld.py ubuntu@'+nodes[i]+':~/HandsDirty/')
		data_id = '1';
		if (i==2 or i==4 or i==6):
			data_id='2'

		os.system('ssh -i ' + node2key[nodes[i]] + ' ubuntu@' + nodes[i] + ' java -jar /home/ubuntu/HandsDirty/jar_export/hbase_rw.jar load t1 /home/ubuntu/HandsDirty/dbdata/loadData_' + data_id+'.txt &')
		#python /home/ubuntu/HandsDirty/helloworld.py &')

	#for i in range(0, len(nodes)):
	#	if nodes[i] == '':
	#		break
		## upload keys ##
		#os.system('scp -i ~/.ssh/bzong_rsa ~/.ssh/bzong_rsa ucsb_cs276n@'+nodes[i]+':')
		## upload nodelist
		#os.system('scp -i ~/.ssh/bzong_rsa ~/hw2-src/nodelist.txt ucsb_cs276n@'+nodes[i]+': &')		
		## upload code ##
	#	os.system('scp -i ~/.ssh/bzong_rsa ~/hw2-src/MyDaemon.py ucsb_cs276n@'+nodes[i]+': &')
		## run MyDaemon ##
		#os.system('ssh -i ~/.ssh/bzong_rsa ucsb_cs276n@'+nodes[i]+' python MyDaemon.py &')
	#os.system('ssh -i ~/zhebo_keypair_1.pem ubuntu@ec2-54-242-51-133.compute-1.amazonaws.com ')
	#os.system('scp -i ~/zhebo_keypair_1.pem ~/MyTest.jar ubuntu@ec2-54-242-51-133.compute-1.amazonaws.com:~/')
'''
