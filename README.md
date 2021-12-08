# microprocessor8086-project
## Encryption & Decryption Algorithm
firstly we got a key of 26 characters of the alphabet every character is present and no 
character is rebeated we map from the original message with the key to the encrypted meesage 
to optimize it we got a table of keys to choose randomly among them and inssert the number of 
the key in the encrypted message so that no one will know the keys and save protected 
Eg:

  | key |           message         | encrypted               |
  |:---:|:-------------------------:|:-----------------------:|
  |  c  |   abcdefghjklmnopqstruxyz | cbcdefghjklmnopqstruxyz |
  |  d  |                           | cdcdefghjklmnopqstruxyz |
  |  e  |                           | cdedefghjklmnopqstruxyz |
  |  f  |                           | cdefefghjklmnopqstruxyz |
  |  g  |                           | cdefgfghjklmnopqstruxyz |
  |  m  |                           | cdefgmghjklmnopqstruxyz |
  |  t  |                           | cdefgmthjklmnopqstruxyz |
  |  u  |                           | cdefgmtujklmnopqstruxyz |
  |  v  |                           | cdefgmtuwklmnopqstruxyz |
  |  w  |                           | cdefgmtuwxlmnopqstruxyz |
  |  x  |                           | cdefgmtuwxymnopqstruxyz |
  |  y  |                           | cdefgmtuwxyznopqstruxyz |
  |  z  |                           | cdefgmtuwxyzaopqstruxyz |
  |  a  |                           | cdefgmtuwxyzabpqstruxyz |
  |  b  |                           | cdefgmtuwxyzabhqstruxyz |
  |  h  |                           | cdefgmtuwxyzabhistruxyz |
  |  i  |                           | cdefgmtuwxyzabhiktruxyz |
  |  j  |                           | cdefgmtuwxyzabhiklruxyz |
  |  k  |                           | cdefgmtuwxyzabhikljuxyz |
  |  l  |                           | cdefgmtuwxyzabhikljnxyz |
  |  n  |                           | cdefgmtuwxyzabhikljnqyz |
  |  o  |                           | cdefgmtuwxyzabhikljnqrz |
  |  p  |                           | cdefgmtuwxyzabhikljnqrs |
 
