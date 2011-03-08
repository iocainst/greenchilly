
'''
>>> gethandicapmargin(24,13.2)
'11.8'
'''
def gethandicapmargin(tot,ct):
    dic={(3, 10.4): '9.0', (19, 10.4): '8', (4, 5.9): '1.9', (39, 12.9): '10.8', (9, 5.4): '0', (3, 7.9): '5.7', (40, 10.9): '7.2', (39, 13.9): '12.2', (40, 12.4): '9.7', (4, 13.9): '12.9', (4, 4.4): '0', (9, 10.4): '8.4', (19, 9.4): '6.5', (2, 10.4): '9.2', (3, 3.4): '0', (3, 9.4): '7.8', (40, 13.9): '11.9', (19, 14): '13.2', (9, 4.9): '0', (3, 11.4): '10.2', (40, 7.4): '0', (4, 11.9): '10.6', (19, 3.9): '0', (29, 9.4): '5.9', (29, 13.9): '12.4', (9, 7.4): '3.8', (9, 3.4): '0', (19, 7.9): '3.9', (9, 14): '13.4', (39, 6.4): '0', (2, 5.4): '2.6', (2, 5.9): '3.4', (3, 4.9): '1', (19, 5.4): '0', (3, 5.9): '2.7', (9, 11.9): '10.4', (29, 11.9): '9.8', (39, 14): '12.8', (2, 11.9): '11.0', (39, 7.4): '1', (29, 8.4): '4.1', (19, 6.9): '2', (29, 8.9): '5', (3, 12.9): '11.9', (3, 8.9): '7.1', (40, 9.4): '4.4', (4, 8.9): '6.7', (4, 9.4): '7.4', (29, 14): '13.0', (29, 4.4): '0', (2, 9.9): '8.7', (40, 9.9): '5.4', (39, 11.9): '9.4', (3, 5.4): '1.9', (29, 5.4): '0', (40, 5.4): '0', (40, 8.9): '3.3', (39, 5.4): '0', (2, 7.4): '5.5', (29, 10.4): '7.6', (9, 10.9): '9.1', (19, 8.4): '4.8', (40, 3.9): '0', (9, 6.4): '1.9', (40, 11.9): '8.9', (40, 6.9): '0', (19, 3.4): '0', (4, 13.4): '12.4', (4, 10.9): '9.4', (40, 11.4): '8.1', (2, 7.9): '6.2', (9, 5.9): '1', (40, 14): '12.6', (4, 5.4): '1', (19, 10.9): '8.7', (39, 10.4): '7', (29, 7.9): '3.1', (4, 7.4): '4.5', (2, 3.4): '0', (3, 3.9): '0', (29, 10.9): '8.3', (2, 10.9): '9.8', (39, 6.9): '0', (19, 4.4): '0', (19, 13.4): '12', (3, 7.4): '5.0', (19, 4.9): '0', (3, 11.9): '10.8', (29, 3.4): '0', (4, 3.4): '0', (4, 12.4): '11.2', (40, 4.4): '0', (2, 13.9): '13.2', (40, 10.4): '6.4', (2, 3.9): '0', (29, 4.9): '0', (2, 12.4): '11.5', (19, 12.4): '10.7', (3, 8.4): '6.4', (9, 8.9): '6.2', (40, 7.9): '1', (39, 10.9): '7.8', (29, 11.4): '9.1', (9, 9.4): '7', (2, 9.4): '8.1', (9, 8.4): '5.5', (4, 4.9): '0', (9, 12.4): '11', (4, 6.4): '2.8', (4, 12.9): '11.8', (9, 13.4): '12.2', (39, 3.9): '0', (9, 13.9): '12.8', (3, 13.4): '12.5', (40, 6.4): '0', (3, 9.9): '8.4', (4, 9.9): '8.1', (3, 13.9): '13.1', (40, 13.4): '11.2', (19, 13.9): '12.6', (40, 12.9): '10.5', (39, 13.4): '11.5', (29, 7.4): '2.1', (4, 6.9): '3.7', (4, 10.4): '8.8', (2, 14): '13.7', (29, 5.9): '0', (9, 9.9): '7.7', (29, 13.9): '12.4', (2, 6.9): '4.8', (39, 3.4): '0', (9, 6.9): '2.9', (29, 9.9): '6.7', (3, 10.9): '9.5', (2, 13.4): '12.6', (4, 11.4): '10', (3, 4.4): '0', (29, 6.9): '1', (9, 4.4): '0', (39, 8.9): '4.2', (19, 11.4): '9.4', (4, 8.4): '6', (39, 9.9): '6.1', (3, 6.9): '4.3', (3, 6.4): '3.5', (40, 8.4): '2.2', (9, 11.4): '9.7', (2, 8.9): '7.4', (3, 14): '13.6', (29, 12.4): '10.5', (2, 11.4): '10.4', (2, 8.4): '6.8', (9, 7.9): '4.7', (39, 4.4): '0', (29, 3.9): '0', (2, 6.4): '4.1', (3, 12.4): '11.4', (40, 5.9): '0', (19, 11.9): '10.1', (19, 6.4): '1', (39, 5.9): '0', (19, 12.9): '11.4', (29, 13.4): '11.8', (40, 3.4): '0', (39, 11.4): '8.6', (39, 12.4): '10.1', (4, 14): '13.5', (19, 7.4): '3', (2, 4.9): '1.8', (4, 3.9): '0', (40, 4.9): '0', (19, 8.9): '5.7', (9, 12.9): '11.6', (29, 12.9): '11.1', (2, 12.9): '12.1', (39, 7.9): '2.2', (19, 5.9): '0', (39, 9.4): '5.2', (19, 9.9): '7.3', (39, 8.4): '3.2', (4, 7.9): '5.3', (9, 3.9): '0', (2, 4.4): '1', (39, 4.9): '0', (29, 6.4): '0'}
    tmnt=(2,3,4,9,19,29,39)
    if ct<3.0:
        ct=3.0
    if ct<14:
        for j in range (6,32):
            i=j/2.0
            if ct<i:
                ct =i-0.1
                break
    else:
        ct=14   
    if tot<40:
        for j in tmnt:
            if tot <= j:
                tot=j
                break
    else:
        tot=40
    margin = dic[tot,ct]
    return margin
#a= gethandicapmargin(7,7.1)
#if __name__ == "__main__":
#    import doctest
#    doctest.testmod()


import unittest

class MarginTests(unittest.TestCase):



    def test_1(self):
        self.assertEqual(gethandicapmargin(1,3.0), '0')
    def test_2(self):
        self.assertEqual(gethandicapmargin(2,4.0), '1')
        self.assertEqual(gethandicapmargin(2,7.1), '5.5')
        self.assertEqual(gethandicapmargin(2,6.0), '4.1')
    def test_non_keys(self):
        self.assertEqual(gethandicapmargin(2,6.7), '4.8')
        self.assertEqual(gethandicapmargin(9,12.2), '11')
        self.assertEqual(gethandicapmargin(3.0,10.3), '9.0')
    def test_9(self):
        self.assertNotEqual(gethandicapmargin(6,6.0), '50', "This should fail")
    def test_19(self):
        self.assertEqual(gethandicapmargin(19,13.4), '12')
    def test_24(self):
        self.assertEqual(gethandicapmargin(24,13.2), '11.8')
        self.assertNotEqual(gethandicapmargin(24,9.7), '16.77', "This should fail")
    def test_39(self):
        self.assertEqual(gethandicapmargin(39,14), '12.8')
    def test_40(self):
        self.assertEqual(gethandicapmargin(40,7.1), '0')
    

if __name__ == '__main__':
    unittest.main()
