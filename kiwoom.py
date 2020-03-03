
from PyQt5.QAxContainer import *

from PyQt5.QtCore import *

class kiwoom(QAxWidget):  # <- 상속받아서 다쓰겠다!
    def __init__(self):
        super().__init__()

        print("Kiwoom class")

        ##event loop 모음

        self.login_event_loop= None
        ####################

        self.get_ocx_instance()
        self.event_slots()       #<-사전에 실행하기 위해 써놓음

        self.signal_login_commConnect()

    def get_ocx_instance(self):
        self.setControl("KHOPENAPI.KHOpenAPICtrl.1")      # <-응용프로그램들을 제어하게해줌

    def event_slots(self):
        self.OnEventConnect.connect(self.login_slot)

    def login_slot(self,errCode):
        print(errCode)

    def signal_login_commConnect(self):
        self.dynamicCall("CommConnect()")

        self.login_event_loop=QEventLoop()
        self.login_event_loop.exec_()
        # 얘를 써줘야 로그인이 완료 됄때 까지 실행이 안됨





#키움증권에서 설치한 것은 OCX방식의 컴포넌츠
#응용프로그렘에서 키움 OpenAPI를 실행할 수 있게 한것
#제어가 가능!
