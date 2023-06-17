#include <stdio.h>
#include <string.h>

#define MAX_BOOKS 100 //도서 저장 정보 최대 100권  

int choice=0;//선택 변수 
FILE *file; // 파일 포인터
char text[100]; // 텍스트를 저장할 배열

struct Book {//구조체 사용 
    char title[100];//문자열 제목 변수  
    char author[100];//문자열 저자 변수  
    char publisher[100];//문자열 출판사 변수  
};

struct Book library[MAX_BOOKS];//도서(제목,저자,출판사)저장변수 (최대 저장 100권   
int numBooks = 0;//도서 저장 갯수 변수  

void addBook() //도서 추가 함수  
{
    if (numBooks >= MAX_BOOKS) //현재 저장된 도서가 100권보다 크거나 같다면  
	{
        printf("더 이상 도서를 등록할 수 없습니다.\n");
        return; //돌아가기  
    }

    struct Book newBook;//북 구조체를 변수로 간단하게 만들기 

    printf("도서 정보를 입력하세요:\n");
    printf("책 제목: ");
    scanf(" %[^\n]", newBook.title);//북 구조체 안에 제목에 값 받기 
    printf("저자: ");
    scanf(" %[^\n]", newBook.author);//북 구조체 안에 저자에 값 받기 
    printf("출판사: ");
    scanf(" %[^\n]", newBook.publisher);//북 구조체 안에 출판사에 값 받기 
    library[numBooks] = newBook; //제목,저자,출판사 값 받은 변수 구조체 변수안에 저장하기 
    numBooks++;//도서 저장 갯수 증가  

    printf("도서가 등록되었습니다.\n");
}

void printLibrary() {//도서 출력  
    if (numBooks == 0) {//저장된 도서가 없다면  
        printf("등록된 도서가 없습니다.\n");
        return;
    }

    printf("도서 목록:\n");
    for (int i = 0; i < numBooks; i++) {//현재 저장되있는 모든 도서 갯수만큼 반복  
        printf("도서 %d:\n", i + 1);//도서 i번째 출력  
        printf("책 제목: %s\n", library[i].title);//도서 i의 제목  
        printf("저자: %s\n", library[i].author);//도서 i의 저자  
        printf("출판사: %s\n", library[i].publisher);//도서 i의 출판사 
        printf("===================\n");//줄 바꿈  
    }
}

void searchBook() //도서 검색  
{
    if (numBooks == 0) //저장된 도서가 없다면  
	{
        printf("등록된 도서가 없습니다.\n");
        return;
    }
    char keyword[100];//도서의 키워드 문자열 변수 생성 
    printf("검색할 도서의 제목을 입력하세요: ");
    scanf(" %[^\n]", keyword);//키워드 값 받기 

    printf("검색 결과:\n");
    int found = 0;//도서를 찾았나 못찾았나 검사하는 변수  
    for (int i = 0; i < numBooks; i++) //저장되어있는 도서의 갯수만큼 반복  
	{
        if (strstr(library[i].title, keyword) != NULL ) //현재 저장되있는 i번째 도서의 제목이 입력한 키워드가 포함되어있다면 해당 도서 출력  
		{
            printf("도서 %d:\n", i + 1);//i번째 도서 
            printf("%s 의 \n", library[i].title);//의 제목 출력 
            printf("출판사는 %s 입니다. \n\n", library[i].publisher);//출판사 출력  
            printf("===================\n");//줄바꿈  
            found = 1;//도서를 찾았기에 1 증가 다시 이 함수가 실행될때 found는 초기화 된다. 
        }
    }

    if (!found) {//found가 0 이면 즉, 찾지 못했다면  
        printf("검색 결과가 없습니다.\n");
    }
}

int fread()//파일 읽기  
{
	file = fopen("example.txt", "r");//example.txt를 오픈하여 읽기 

        if (file == NULL) {//파일이 없다면 
            printf("파일을 열 수 없습니다.");
            return 1; //메인으로 돌아가기  
        }

        // 파일에서 텍스트 읽기
        if (fgets(text, sizeof(text), file) != NULL) //파일안에 텍스트가 있다면  
		{
        printf("파일 내용: %s\n", text);//텍스트 내용 출력 
    } else { //파일안에 텍스트가 없다면  
        printf("파일 내용 없음\n");
    }
        // 파일 닫기
        fclose(file);
}

int fwrite()//파일 쓰기  
{
	// 파일 열기 (쓰기 모드)
        file = fopen("example.txt", "w");

        if (file == NULL) {//파일이 없다면 
            printf("파일을 열 수 없습니다.\n\n");
            return 1;//메인으로 돌아가기 
        }

        // 사용자로부터 텍스트 입력 받기
        printf("내용을 입력하세요: ");
        scanf(" %[^\n]", text);

        // 파일에 텍스트 쓰기
        fprintf(file, "%s", text);

        // 파일 닫기
        fclose(file);
}    

int start_UI() {
    printf("도서관리 프로그램\n");
	printf("===================\n");
	printf("||1.파일 읽기    ||\n");
	printf("||2.추가         ||\n");
	printf("||3.출력         ||\n");
	printf("||4.검색         ||\n");
	printf("||5.파일 쓰기    ||\n");
	printf("||6.종료         ||\n");
	printf("===================\n");
	printf(" 사용자 입력: ");
	scanf("%d",&choice);//사용자 입력값 정수형으로 받기  

	if(choice == 1)//사용자가 1번을 누르면 파일 읽기 함수 실행  
	{
		fread();
	}
	else if (choice == 2) {//사용자가 2번을 누르면 도서 추가 함수 실행  
        addBook();
    } else if (choice == 3) {//사용자가 3번을 누르면 도서 출력 함수 실행  
        printLibrary();
    } else if (choice == 4) {//사용자가 4번을 누르면 도서 검색 함수 실행  
        searchBook();
    } else if (choice == 5) {//사용자가 5번을 누르면 파일 쓰기 함수 실행  
       fwrite();
    }else if(choice == 6)//사용자가 6번을 누르면 프로그램 종료  
	{
		printf("\n프로그램을 종료합니다.\n");
		return 0;	
	}else //사용자가 그외 숫자를 누르면 오류 알림   
	{
		printf("잘못된 선택입니다.\n\n");
	}
    return 1;//메인으로 돌아가기  
}

int main() {//메인 함수 가장 먼저 실행  
    while (start_UI()) {} //start_UI 함수 계속 실행  
    return 0;
}

