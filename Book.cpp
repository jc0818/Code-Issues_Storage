#include <stdio.h>
#include <string.h>

#define MAX_BOOKS 100 //���� ���� ���� �ִ� 100��  

int choice=0;//���� ���� 
FILE *file; // ���� ������
char text[100]; // �ؽ�Ʈ�� ������ �迭

struct Book {//����ü ��� 
    char title[100];//���ڿ� ���� ����  
    char author[100];//���ڿ� ���� ����  
    char publisher[100];//���ڿ� ���ǻ� ����  
};

struct Book library[MAX_BOOKS];//����(����,����,���ǻ�)���庯�� (�ִ� ���� 100��   
int numBooks = 0;//���� ���� ���� ����  

void addBook() //���� �߰� �Լ�  
{
    if (numBooks >= MAX_BOOKS) //���� ����� ������ 100�Ǻ��� ũ�ų� ���ٸ�  
	{
        printf("�� �̻� ������ ����� �� �����ϴ�.\n");
        return; //���ư���  
    }

    struct Book newBook;//�� ����ü�� ������ �����ϰ� ����� 

    printf("���� ������ �Է��ϼ���:\n");
    printf("å ����: ");
    scanf(" %[^\n]", newBook.title);//�� ����ü �ȿ� ���� �� �ޱ� 
    printf("����: ");
    scanf(" %[^\n]", newBook.author);//�� ����ü �ȿ� ���ڿ� �� �ޱ� 
    printf("���ǻ�: ");
    scanf(" %[^\n]", newBook.publisher);//�� ����ü �ȿ� ���ǻ翡 �� �ޱ� 
    library[numBooks] = newBook; //����,����,���ǻ� �� ���� ���� ����ü �����ȿ� �����ϱ� 
    numBooks++;//���� ���� ���� ����  

    printf("������ ��ϵǾ����ϴ�.\n");
}

void printLibrary() {//���� ���  
    if (numBooks == 0) {//����� ������ ���ٸ�  
        printf("��ϵ� ������ �����ϴ�.\n");
        return;
    }

    printf("���� ���:\n");
    for (int i = 0; i < numBooks; i++) {//���� ������ִ� ��� ���� ������ŭ �ݺ�  
        printf("���� %d:\n", i + 1);//���� i��° ���  
        printf("å ����: %s\n", library[i].title);//���� i�� ����  
        printf("����: %s\n", library[i].author);//���� i�� ����  
        printf("���ǻ�: %s\n", library[i].publisher);//���� i�� ���ǻ� 
        printf("===================\n");//�� �ٲ�  
    }
}

void searchBook() //���� �˻�  
{
    if (numBooks == 0) //����� ������ ���ٸ�  
	{
        printf("��ϵ� ������ �����ϴ�.\n");
        return;
    }
    char keyword[100];//������ Ű���� ���ڿ� ���� ���� 
    printf("�˻��� ������ ������ �Է��ϼ���: ");
    scanf(" %[^\n]", keyword);//Ű���� �� �ޱ� 

    printf("�˻� ���:\n");
    int found = 0;//������ ã�ҳ� ��ã�ҳ� �˻��ϴ� ����  
    for (int i = 0; i < numBooks; i++) //����Ǿ��ִ� ������ ������ŭ �ݺ�  
	{
        if (strstr(library[i].title, keyword) != NULL ) //���� ������ִ� i��° ������ ������ �Է��� Ű���尡 ���ԵǾ��ִٸ� �ش� ���� ���  
		{
            printf("���� %d:\n", i + 1);//i��° ���� 
            printf("%s �� \n", library[i].title);//�� ���� ��� 
            printf("���ǻ�� %s �Դϴ�. \n\n", library[i].publisher);//���ǻ� ���  
            printf("===================\n");//�ٹٲ�  
            found = 1;//������ ã�ұ⿡ 1 ���� �ٽ� �� �Լ��� ����ɶ� found�� �ʱ�ȭ �ȴ�. 
        }
    }

    if (!found) {//found�� 0 �̸� ��, ã�� ���ߴٸ�  
        printf("�˻� ����� �����ϴ�.\n");
    }
}

int fread()//���� �б�  
{
	file = fopen("example.txt", "r");//example.txt�� �����Ͽ� �б� 

        if (file == NULL) {//������ ���ٸ� 
            printf("������ �� �� �����ϴ�.");
            return 1; //�������� ���ư���  
        }

        // ���Ͽ��� �ؽ�Ʈ �б�
        if (fgets(text, sizeof(text), file) != NULL) //���Ͼȿ� �ؽ�Ʈ�� �ִٸ�  
		{
        printf("���� ����: %s\n", text);//�ؽ�Ʈ ���� ��� 
    } else { //���Ͼȿ� �ؽ�Ʈ�� ���ٸ�  
        printf("���� ���� ����\n");
    }
        // ���� �ݱ�
        fclose(file);
}

int fwrite()//���� ����  
{
	// ���� ���� (���� ���)
        file = fopen("example.txt", "w");

        if (file == NULL) {//������ ���ٸ� 
            printf("������ �� �� �����ϴ�.\n\n");
            return 1;//�������� ���ư��� 
        }

        // ����ڷκ��� �ؽ�Ʈ �Է� �ޱ�
        printf("������ �Է��ϼ���: ");
        scanf(" %[^\n]", text);

        // ���Ͽ� �ؽ�Ʈ ����
        fprintf(file, "%s", text);

        // ���� �ݱ�
        fclose(file);
}    

int start_UI() {
    printf("�������� ���α׷�\n");
	printf("===================\n");
	printf("||1.���� �б�    ||\n");
	printf("||2.�߰�         ||\n");
	printf("||3.���         ||\n");
	printf("||4.�˻�         ||\n");
	printf("||5.���� ����    ||\n");
	printf("||6.����         ||\n");
	printf("===================\n");
	printf(" ����� �Է�: ");
	scanf("%d",&choice);//����� �Է°� ���������� �ޱ�  

	if(choice == 1)//����ڰ� 1���� ������ ���� �б� �Լ� ����  
	{
		fread();
	}
	else if (choice == 2) {//����ڰ� 2���� ������ ���� �߰� �Լ� ����  
        addBook();
    } else if (choice == 3) {//����ڰ� 3���� ������ ���� ��� �Լ� ����  
        printLibrary();
    } else if (choice == 4) {//����ڰ� 4���� ������ ���� �˻� �Լ� ����  
        searchBook();
    } else if (choice == 5) {//����ڰ� 5���� ������ ���� ���� �Լ� ����  
       fwrite();
    }else if(choice == 6)//����ڰ� 6���� ������ ���α׷� ����  
	{
		printf("\n���α׷��� �����մϴ�.\n");
		return 0;	
	}else //����ڰ� �׿� ���ڸ� ������ ���� �˸�   
	{
		printf("�߸��� �����Դϴ�.\n\n");
	}
    return 1;//�������� ���ư���  
}

int main() {//���� �Լ� ���� ���� ����  
    while (start_UI()) {} //start_UI �Լ� ��� ����  
    return 0;
}

