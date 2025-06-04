@echo off
if exist parser.java del parser.java
if exist sym.java del sym.java
if exist AnalisadorLexico.java del AnalisadorLexico.java
for /r %%f in (*.class) do del "%%f"