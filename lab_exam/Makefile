# Makefile for lab exam questions

# Default compiler flags
CFLAGS = -g -Wall -Wextra

# Rules for each question
q1:
	gcc $(CFLAGS) q01/q1.c q01/q1.s -o q1 && ./q1 && rm q1

q1g:
	gcc $(CFLAGS) q01/q1.c q01/q1.s -o q1 && gdb ./q1 && rm q1

q2:
	gcc $(CFLAGS) q02/q2.c q02/q2.s -o q2 && ./q2 && rm q2

q2g:
	gcc $(CFLAGS) q02/q2.c q02/q2.s -o q2 && gdb ./q2 && rm q2

q3:
	gcc $(CFLAGS) q03/q3.c q03/q3.s -o q3 && ./q3 && rm q3

q3g:
	gcc $(CFLAGS) q03/q3.c q03/q3.s -o q3 && gdb ./q3 && rm q3

q4:
	gcc $(CFLAGS) q04/q4.c q04/q4.s -o q4 && ./q4 && rm q4

q4g:
	gcc $(CFLAGS) q04/q4.c q04/q4.s -o q4 && gdb ./q4 && rm q4

q5:
	gcc $(CFLAGS) q05/q5.c q05/q5.s -o q5 && ./q5 && rm q5

q5g:
	gcc $(CFLAGS) q05/q5.c q05/q5.s -o q5 && gdb ./q5 && rm q5

q6:
	gcc $(CFLAGS) q06/q6.c q06/q6.s -o q6 && ./q6 && rm q6

q6g:
	gcc $(CFLAGS) q06/q6.c q06/q6.s -o q6 && gdb ./q6 && rm q6

q7:
	gcc $(CFLAGS) q07/q7.c q07/q7.s -o q7 && ./q7 && rm q7

q7g:
	gcc $(CFLAGS) q07/q7.c q07/q7.s -o q7 && gdb ./q7 && rm q7

q8:
	gcc $(CFLAGS) q08/q8.c q08/q8.s -o q8 && ./q8 && rm q8

q8g:
	gcc $(CFLAGS) q08/q8.c q08/q8.s -o q8 && gdb ./q8 && rm q8

q9:
	gcc $(CFLAGS) q09/q9.c q09/q9.s -o q9 && ./q9 && rm q9

q9g:
	gcc $(CFLAGS) q09/q9.c q09/q9.s -o q9 && gdb ./q9 && rm q9

q10:
	gcc $(CFLAGS) q10/q10.c q10/q10.s -o q10_exe && ./q10_exe && rm q10_exe

q10g:
	gcc $(CFLAGS) q10/q10.c q10/q10.s -o q10_exe && gdb ./q10_exe && rm q10_exe

q11:
	gcc $(CFLAGS) q11/q11.c q11/q11.s -o q11_exe && ./q11_exe && rm q11_exe

q11g:
	gcc $(CFLAGS) q11/q11.c q11/q11.s -o q11_exe && gdb ./q11_exe && rm q11_exe

q12:
	gcc $(CFLAGS) q12/q12.c q12/q12.s -o q12_exe && ./q12_exe && rm q12_exe

q12g:
	gcc $(CFLAGS) q12/q12.c q12/q12.s -o q12_exe && gdb ./q12_exe && rm q12_exe

# Clean all generated files
clean:
	rm -f q1 q2 q3 q4 q5 q6 q7 q8 q9 q10_exe q11_exe q12_exe
	find . -name "*.o" -type f -delete

# Phony targets
.PHONY: q1 q1g q2 q2g q3 q3g q4 q4g q5 q5g q6 q6g q7 q7g q8 q8g q9 q9g q10 q10g q11 q11g q12 q12g clean
