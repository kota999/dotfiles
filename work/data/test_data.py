import io
import numpy as np

fp = io.open("test.csv","w")
newline = u"\n"
#fp.write(u"uriagebi,shohin,uriage,tanka,kazu" + newline)
# OUT: 33L

shohin_list = ("shoes","bag","globe","boots","snicker","shirts","tshirts","pants","geans")
tanka_list = (5000,8000,1500,12000,4000,4000,3000,10000,12000)

for i in xrange(1,62):
    for j in xrange(0, np.random.randint(0,21)):
        shohin_num = len(shohin_list)
        k = np.random.randint(0,shohin_num)
        shohin = shohin_list[k]
        tanka = tanka_list[k]
        num = np.random.randint(1,6)
        uriage = tanka * num

        #fp.write(u"aaa%d,\'%s\',%d,%d,%dbbb"%(i,shohin,uriage,tanka,num) + newline)
        fp.write(u"%d,%s,%d,%d,%d"%(i,shohin,uriage,tanka,num) + newline)

fp.close()
