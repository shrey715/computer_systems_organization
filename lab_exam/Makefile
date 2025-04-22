# Makefile for lab exam questions

# Default compiler flags
CFLAGS = -g -Wall -Wextra

# Rules for each question
q1:
	gcc $(CFLAGS) q01/q1.c q01/q1.s -o q1 && ./q1 && rm q1

q2:
	gcc $(CFLAGS) q02/q2.c q02/q2.s -o q2 && ./q2 && rm q2

q3:
	gcc $(CFLAGS) q03/q3.c q03/q3.s -o q3 && ./q3 && rm q3

q4:
	gcc $(CFLAGS) q04/q4.c q04/q4.s -o q4 && ./q4 && rm q4

q5:
	gcc $(CFLAGS) q05/q5.c q05/q5.s -o q5 && ./q5 && rm q5

q6:
	gcc $(CFLAGS) q06/q6.c q06/q6.s -o q6 && ./q6 && rm q6

q7:
	gcc $(CFLAGS) q07/q7.c q07/q7.s -o q7 && ./q7 && rm q7

q8:
	gcc $(CFLAGS) q08/q8.c q08/q8.s -o q8 && ./q8 && rm q8

q9:
	gcc $(CFLAGS) q09/q9.c q09/q9.s -o q9 && ./q9 && rm q9

q10:
	gcc $(CFLAGS) q10/q10.c q10/q10.s -o q10 && ./q10 && rm q10

q11:
	gcc $(CFLAGS) q11/q11.c q11/q11.s -o q11 && ./q11 && rm q11

q12:
	gcc $(CFLAGS) q12/q12.c q12/q12.s -o q12 && ./q12 && rm q12

# Clean all generated files
clean:
	rm -f q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12
	find . -name "*.o" -type f -delete

# Phony targets
.PHONY: q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12 clean
