#include <stdio.h>
#include <stdlib.h>

int main()
{
    char a[26]="cdefgmtuvwxyzabhijklnopqrs";
    char inv_key[26];
    for(int i=0;i<26;i++)
    {
        inv_key[a[i]-'a']=(char)(i+'a');
    }
    int n=26;
    char s[100];
    gets(s);
    for(int i=0;s[i];i++)
    {
        if(s[i]==' ')continue;
        s[i]=a[s[i]-'a'];
    }
    printf("%s\n",s);
    for(int i=0;i<s[i];i++)
    {
        if(s[i]==' ')continue;
        s[i]=inv_key[s[i]-'a'];
    }
    printf("%s\n",s);
    return 0;
}
