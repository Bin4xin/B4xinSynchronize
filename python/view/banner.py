# def print(self):
#     self.banner_view = "adcb"
#     print(self.banner_view)
#
#
# if __name__ == "__main__":
#     print()


class banner():
    def __init__(self, banner1):
        self.banner1 = banner1

    def show_(self):
        print(self.banner1.title())


banners = print('a')
banners.show_()

# class User():
#     def __init__(self,fname,lname):
#         self.fname = fname
#         self.lname = lname
#
#     def show_(self):
#         print(self.fname.title()+self.lname.title())
#
#
# users = User('harry ','potter')
# users.show_()
