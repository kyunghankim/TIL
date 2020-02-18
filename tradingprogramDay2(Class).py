#S_price = 3900
#s_ticker='삼성전자'
#print(S_price,s_ticker)
#count=0
#for i in range(10):
#    count +=1
#    if count ==10:
#        print(count)
#        break
#for i,value in enumerate(['apple','amazon','facebook']):
#    print("%s 순번과 %s 값" %(i,value))
# cnt=0
# while True:
#     print("마법을 쓰기 위해 %s번째 시도를 하였다." % cnt)
#     cnt+=1
#     if cnt==100:
#         print(" %s번째 시도 끝에 마법을 써서 빠져나간다" % cnt)
#         break
# cnt = 0
# repeat_boolean=True
# while repeat_boolean:
#     print("%s 아직은 while문 도는 중" % cnt)
#     cnt+=1
#     if cnt ==50:
#         repeat_boolean=False
# stock_price=1000
# while stock_price !=100000:
#     stock_price+=1000
#     print("방금 %s원을 더해서 %s원이 되었다" % (1000,stock_price))
class Parent():
    def __init__(self):
        print("부모 클라스!")
        self.money=5000000
    def book(self):
        print("부모의 서재안에 주식책")
class Child_1(Parent):
    def __init__(self):
        super().__init__()
        print("첫 번째 자식입니다.")
        print(self.money,":상속된 돈")
class Child_2(Parent):
    def __init__(self):
        print("두 번째 자식입니다.")
        self.book()
Child_1()
Child_2()
