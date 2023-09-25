#include <stdio.h>
#include <stdlib.h>

int main (int argc, char* argv[]) {	//	argc: number of inputs, argv: input data as string
	if(argc <= 1) {
		printf("wzip: file1 [file2 ...]\n");
		return 1;
	}

	int prevChar, currChar;
	unsigned int cnt;

	for(int i=1; i<argc; i++) {	// argv[0]: path, argv[1]: input data, same for 2, 3, ... 
		
		FILE *rdFile = fopen(argv[i], "r");
		if (rdFile == NULL) {
			printf("wzip: cannot open file\n");
			return 1;
		}
		
		
		if(i == 1) {	// do this only for first file to prevent change prevChar, cnt
			prevChar = fgetc(rdFile);
			cnt = 1;
		}

		while(prevChar !=  EOF) {
			if(prevChar == (currChar = fgetc(rdFile))) cnt++;
			else if(currChar == EOF && i != argc-1){	// if file is end but next file exists
				break;		// go to next file
			}
			else{
				char out = (char)prevChar;
				fwrite(&cnt, 4, 1, stdout);
				fwrite(&out, 1, 1, stdout);
				//printf("%d%c", cnt, prevChar);
				prevChar = currChar;
				cnt = 1;
			}
		}
		fclose(rdFile);
	}

	return 0;
}


