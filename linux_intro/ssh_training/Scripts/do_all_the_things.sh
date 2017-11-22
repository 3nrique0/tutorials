#! /bin/bash


echo ""

echo "Who am i ? -- What's my user name?"
whoami

echo ""

echo "What is the name of my host ? -- Which computer am I working on?"
hostname

echo ""

echo "Print working directory -- Where am I?"
pwd

echo ""

echo "Who is the owner of this WHOLE place?"
namei -o $(pwd)

echo ""


