#include <stdio.h>
#include <stdlib.h>

int main (int argc, char* argv[]) {	//	argc: number of inputs, argv: input data as string
	if(argc < 2) {
		printf("wunzip: file1 [file2 ...]\n");
		return 1;
	}

	for(int i=1; i<argc; i++) {	// argv[0]: path, argv[1]: input data, same for 2, 3, ... 
		
		FILE *rdFile = fopen(argv[i], "r");
		if (rdFile == NULL) {
			printf("wzip: cannot open file\n");
			return 1;
		}
		
		int num;
		while(fread(&num, 4, 1, rdFile) != 0) {
			char out = (char) fgetc(rdFile);
			for(int j=0; j<num; j++) fwrite(&out, 1, 1, stdout);		
		}
	}
	return 0;
}


