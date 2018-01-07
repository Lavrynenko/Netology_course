d = [chr(i) for i in range(127)]
dl = len(d)

prepval = lambda val: zip( range(0,len(val)), val )

enc = lambda ch,key: (ch+key) % dl
dec = lambda ch,key: (ch-key+dl) % dl

def vigenere(value, key, func):
    kl = len(key)
    value = prepval( value )
    e = [ func( ord(c), ord(key[i%kl]) ) for (i,c) in value ]
    return ''.join( [ d[c] for c in e ] )

src = 'Hello world'
key = 'kkk'

tmp = vigenere( src, key, enc )
print (tmp)
print (vigenere( tmp, key, dec ))