# -*- coding: utf-8 -*-
"""
Created on Sun Jun  2 01:01:21 2019

@author: richardz
"""
######################################################################

InitFileName  = "Init_File.v"
SrcFileName   = "gpioDemo.bin"
TagFileName0  = "gpioDemo0.Hex"
TagFileName1  = "gpioDemo1.Hex"
TagFileName2  = "gpioDemo2.Hex"
TagFileName3  = "gpioDemo3.Hex"

######################################################################

import time
import binascii

######################################################################

def ReadFileAllToString(FileName):
	DesignFile = open(FileName)
	FileString = DesignFile.read()
	DesignFile.close()
	return(FileString)

def ReadLineToString(FileString,LineNumber):
	RowStartPos   = 0;
	for i in range(LineNumber):
		RowEndPos	  = FileString.find("\n",RowStartPos)
		LineString  = FileString[RowStartPos:RowEndPos]
		RowStartPos = RowEndPos + 1
	return (LineString)

def SearchString(FileString,SubString):
    SubStrPos           = FileString.find(SubString)	
    SubStrLineNumber    = FileString[0:SubStrPos].count("\n") + 1
    SubStrLineStr       = ReadLineToString(FileString,SubStrLineNumber).strip()
    if ((SubStrPos == -1) or (SubStrLineStr[0:2] == "//")):
        return (-1)    
    
    SubStrStartPos  = SubStrPos + len(SubString)
    SubStrEndPos    = FileString.find('\n',SubStrStartPos)
    OutString = FileString[SubStrStartPos : SubStrEndPos].strip()
    OutString = OutString[1:len(OutString)-1]    
    return (OutString)

def BinFileRead(SrcFileName,ByteNum):
    BinFile = open(SrcFileName,'rb')
    i=0
    WordString = ""
    WordLen = 11
    while WordLen >= 11 :
        ReadHex = str(binascii.b2a_hex(BinFile.read(4)))
        WordLen     = len(ReadHex)
        ReadHex = ReadHex[2:WordLen-1]+"00000000"
        WordString = WordString + ReadHex[ByteNum*2+0:ByteNum*2+2] + "\n"
        i=i+1
    BinFile.close()
    return (WordString)
    
def WriteHexFile(SrcFileName,FileString):
	HexFile = open(SrcFileName,"w")
	HexFile.write(FileString)
	HexFile.close()
    
######################################################################

print (time.strftime("\n\n %Y-%m-%d %H:%M:%S\n", time.localtime()))

InitFileString = ReadFileAllToString(InitFileName)

BinFileName = SearchString(InitFileString,"SoftBinFile")
if (BinFileName != -1):
    SrcFileName = BinFileName
    
HexFileName0 = SearchString(InitFileString,"SoftHexFile0")
HexFileName1 = SearchString(InitFileString,"SoftHexFile1")
HexFileName2 = SearchString(InitFileString,"SoftHexFile2")
HexFileName3 = SearchString(InitFileString,"SoftHexFile3")
if (HexFileName0 != -1):
    TagFileName0 = HexFileName0
if (HexFileName1 != -1):
    TagFileName1 = HexFileName1
if (HexFileName2 != -1):
    TagFileName2 = HexFileName2
if (HexFileName3 != -1):
    TagFileName3 = HexFileName3
    
print ("Source Bin File :" , SrcFileName  , '\n')
print ("Taget  Hex File :" , TagFileName0 , '\n')
print ("Taget  Hex File :" , TagFileName1 , '\n')
print ("Taget  Hex File :" , TagFileName2 , '\n')
print ("Taget  Hex File :" , TagFileName3 , '\n')

HexString = BinFileRead(SrcFileName,0)
WriteHexFile(TagFileName0,HexString)

HexString = BinFileRead(SrcFileName,1)
WriteHexFile(TagFileName1,HexString)

HexString = BinFileRead(SrcFileName,2)
WriteHexFile(TagFileName2,HexString)

HexString = BinFileRead(SrcFileName,3)
WriteHexFile(TagFileName3,HexString)

print ("Conversion success!!!")

input ("Press any key to quit.......")
######################################################################
