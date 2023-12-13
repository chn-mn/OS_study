
_test_lottery:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
      }
   }
}

int
main(int argc, char *argv[]){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	81 ec 38 04 00 00    	sub    $0x438,%esp
   int numtickets[]={20,10,30};
   int pid_chds[3];

   pid_chds[0]=getpid();
  17:	e8 87 04 00 00       	call   4a3 <getpid>
   settickets(numtickets[0]);
  1c:	83 ec 0c             	sub    $0xc,%esp
  1f:	6a 14                	push   $0x14
   pid_chds[0]=getpid();
  21:	89 c3                	mov    %eax,%ebx
   settickets(numtickets[0]);
  23:	e8 a3 04 00 00       	call   4cb <settickets>

   int i;
   for(i=1;i<3;i++){
      pid_chds[i]=fork();
  28:	e8 ee 03 00 00       	call   41b <fork>
      if(pid_chds[i]==0){
  2d:	83 c4 10             	add    $0x10,%esp
      pid_chds[i]=fork();
  30:	89 85 d4 fb ff ff    	mov    %eax,-0x42c(%ebp)
      if(pid_chds[i]==0){
  36:	85 c0                	test   %eax,%eax
  38:	0f 84 73 01 00 00    	je     1b1 <main+0x1b1>
         for (;;){
            spin();
         }
      }
      else{
         settickets(numtickets[i]);
  3e:	83 ec 0c             	sub    $0xc,%esp
  41:	89 c6                	mov    %eax,%esi
  43:	6a 0a                	push   $0xa
  45:	e8 81 04 00 00       	call   4cb <settickets>
      pid_chds[i]=fork();
  4a:	e8 cc 03 00 00       	call   41b <fork>
      if(pid_chds[i]==0){
  4f:	83 c4 10             	add    $0x10,%esp
      pid_chds[i]=fork();
  52:	89 85 d8 fb ff ff    	mov    %eax,-0x428(%ebp)
  58:	89 c7                	mov    %eax,%edi
      if(pid_chds[i]==0){
  5a:	85 c0                	test   %eax,%eax
  5c:	0f 84 4f 01 00 00    	je     1b1 <main+0x1b1>
         settickets(numtickets[i]);
  62:	83 ec 0c             	sub    $0xc,%esp
  65:	6a 1e                	push   $0x1e
  67:	e8 5f 04 00 00       	call   4cb <settickets>

   struct pstat st;
   int time=0;
   int ticks[3]={0,0,0};

   printf(1,"pid:%d, pid:%d, pid:%d\n",pid_chds[0],pid_chds[1],pid_chds[2]);
  6c:	89 3c 24             	mov    %edi,(%esp)
  6f:	56                   	push   %esi
  70:	53                   	push   %ebx
  71:	68 b8 08 00 00       	push   $0x8b8
  76:	6a 01                	push   $0x1
   int ticks[3]={0,0,0};
  78:	c7 85 dc fb ff ff 00 	movl   $0x0,-0x424(%ebp)
  7f:	00 00 00 
  82:	c7 85 e0 fb ff ff 00 	movl   $0x0,-0x420(%ebp)
  89:	00 00 00 
  8c:	c7 85 e4 fb ff ff 00 	movl   $0x0,-0x41c(%ebp)
  93:	00 00 00 
   printf(1,"pid:%d, pid:%d, pid:%d\n",pid_chds[0],pid_chds[1],pid_chds[2]);
  96:	e8 f5 04 00 00       	call   590 <printf>
   printf(1,"tickets:%d, tickets:%d, tickets:%d\n",30,20,10);
  9b:	83 c4 14             	add    $0x14,%esp
  9e:	6a 0a                	push   $0xa
  a0:	6a 14                	push   $0x14
  a2:	6a 1e                	push   $0x1e
  a4:	68 f0 08 00 00       	push   $0x8f0
  a9:	6a 01                	push   $0x1
  ab:	e8 e0 04 00 00       	call   590 <printf>
  b0:	b8 40 42 0f 00       	mov    $0xf4240,%eax
  b5:	89 9d c0 fb ff ff    	mov    %ebx,-0x440(%ebp)
  bb:	83 c4 20             	add    $0x20,%esp
  be:	89 c3                	mov    %eax,%ebx

   while(time<1000000){
      if(getpinfo(&st)!=0){
  c0:	83 ec 0c             	sub    $0xc,%esp
  c3:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
  c9:	50                   	push   %eax
  ca:	e8 04 04 00 00       	call   4d3 <getpinfo>
  cf:	83 c4 10             	add    $0x10,%esp
  d2:	89 c7                	mov    %eax,%edi
  d4:	85 c0                	test   %eax,%eax
  d6:	0f 85 90 00 00 00    	jne    16c <main+0x16c>
   pid_chds[0]=getpid();
  dc:	8b 95 c0 fb ff ff    	mov    -0x440(%ebp),%edx
         goto Cleanup;
      }

      int j;
      int pid;
      for(i=0;i<3;i++){
  e2:	31 f6                	xor    %esi,%esi
  e4:	8d 8d e8 fe ff ff    	lea    -0x118(%ebp),%ecx
         pid=pid_chds[i];
         for(j=0;j<NPROC;j++){
  ea:	89 9d c4 fb ff ff    	mov    %ebx,-0x43c(%ebp)
  f0:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
  f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fd:	8d 76 00             	lea    0x0(%esi),%esi
            if(st.pid[j]==pid){
 100:	39 10                	cmp    %edx,(%eax)
 102:	75 0d                	jne    111 <main+0x111>
               ticks[i]=st.ticks[j];
 104:	8b 98 00 01 00 00    	mov    0x100(%eax),%ebx
 10a:	89 9c b5 dc fb ff ff 	mov    %ebx,-0x424(%ebp,%esi,4)
         for(j=0;j<NPROC;j++){
 111:	83 c0 04             	add    $0x4,%eax
 114:	39 c8                	cmp    %ecx,%eax
 116:	75 e8                	jne    100 <main+0x100>
      for(i=0;i<3;i++){
 118:	83 c6 01             	add    $0x1,%esi
 11b:	8b 9d c4 fb ff ff    	mov    -0x43c(%ebp),%ebx
 121:	83 fe 03             	cmp    $0x3,%esi
 124:	74 09                	je     12f <main+0x12f>
         pid=pid_chds[i];
 126:	8b 94 b5 d0 fb ff ff 	mov    -0x430(%ebp,%esi,4),%edx
 12d:	eb bb                	jmp    ea <main+0xea>
   while(time<1000000){
 12f:	83 eb 01             	sub    $0x1,%ebx
 132:	75 8c                	jne    c0 <main+0xc0>
 134:	8b 9d c0 fb ff ff    	mov    -0x440(%ebp),%ebx
      spin();
      time++;
   }

   for(i=0;i<3;i++){
      printf(1,"%d, ",ticks[i]);
 13a:	52                   	push   %edx
 13b:	ff b4 bd dc fb ff ff 	push   -0x424(%ebp,%edi,4)
   for(i=0;i<3;i++){
 142:	83 c7 01             	add    $0x1,%edi
      printf(1,"%d, ",ticks[i]);
 145:	68 e8 08 00 00       	push   $0x8e8
 14a:	6a 01                	push   $0x1
 14c:	e8 3f 04 00 00       	call   590 <printf>
   for(i=0;i<3;i++){
 151:	83 c4 10             	add    $0x10,%esp
 154:	83 ff 03             	cmp    $0x3,%edi
 157:	75 e1                	jne    13a <main+0x13a>
   }
   printf(1,"\n");
 159:	50                   	push   %eax
 15a:	50                   	push   %eax
 15b:	68 ce 08 00 00       	push   $0x8ce
 160:	6a 01                	push   $0x1
 162:	e8 29 04 00 00       	call   590 <printf>
 167:	83 c4 10             	add    $0x10,%esp
 16a:	eb 18                	jmp    184 <main+0x184>
         printf(1,"check failed: getpinfo\n");
 16c:	83 ec 08             	sub    $0x8,%esp
 16f:	8b 9d c0 fb ff ff    	mov    -0x440(%ebp),%ebx
 175:	68 d0 08 00 00       	push   $0x8d0
 17a:	6a 01                	push   $0x1
 17c:	e8 0f 04 00 00       	call   590 <printf>
         goto Cleanup;
 181:	83 c4 10             	add    $0x10,%esp

Cleanup:
   for (i = 0; pid_chds[i] > 0; i++){
 184:	8d b5 d0 fb ff ff    	lea    -0x430(%ebp),%esi
 18a:	85 db                	test   %ebx,%ebx
 18c:	7e 15                	jle    1a3 <main+0x1a3>
      kill(pid_chds[i]);
 18e:	83 ec 0c             	sub    $0xc,%esp
   for (i = 0; pid_chds[i] > 0; i++){
 191:	83 c6 04             	add    $0x4,%esi
      kill(pid_chds[i]);
 194:	53                   	push   %ebx
 195:	e8 b9 02 00 00       	call   453 <kill>
   for (i = 0; pid_chds[i] > 0; i++){
 19a:	8b 1e                	mov    (%esi),%ebx
 19c:	83 c4 10             	add    $0x10,%esp
 19f:	85 db                	test   %ebx,%ebx
 1a1:	7f eb                	jg     18e <main+0x18e>
   }
   while(wait() > -1);
 1a3:	e8 83 02 00 00       	call   42b <wait>
 1a8:	85 c0                	test   %eax,%eax
 1aa:	79 f7                	jns    1a3 <main+0x1a3>

   exit();
 1ac:	e8 72 02 00 00       	call   423 <exit>
            spin();
 1b1:	eb fe                	jmp    1b1 <main+0x1b1>
 1b3:	66 90                	xchg   %ax,%ax
 1b5:	66 90                	xchg   %ax,%ax
 1b7:	66 90                	xchg   %ax,%ax
 1b9:	66 90                	xchg   %ax,%ax
 1bb:	66 90                	xchg   %ax,%ax
 1bd:	66 90                	xchg   %ax,%ax
 1bf:	90                   	nop

000001c0 <spin>:
}
 1c0:	c3                   	ret    
 1c1:	66 90                	xchg   %ax,%ax
 1c3:	66 90                	xchg   %ax,%ax
 1c5:	66 90                	xchg   %ax,%ax
 1c7:	66 90                	xchg   %ax,%ax
 1c9:	66 90                	xchg   %ax,%ax
 1cb:	66 90                	xchg   %ax,%ax
 1cd:	66 90                	xchg   %ax,%ax
 1cf:	90                   	nop

000001d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1d0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1d1:	31 c0                	xor    %eax,%eax
{
 1d3:	89 e5                	mov    %esp,%ebp
 1d5:	53                   	push   %ebx
 1d6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1e0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1e4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1e7:	83 c0 01             	add    $0x1,%eax
 1ea:	84 d2                	test   %dl,%dl
 1ec:	75 f2                	jne    1e0 <strcpy+0x10>
    ;
  return os;
}
 1ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1f1:	89 c8                	mov    %ecx,%eax
 1f3:	c9                   	leave  
 1f4:	c3                   	ret    
 1f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000200 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	53                   	push   %ebx
 204:	8b 55 08             	mov    0x8(%ebp),%edx
 207:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 20a:	0f b6 02             	movzbl (%edx),%eax
 20d:	84 c0                	test   %al,%al
 20f:	75 17                	jne    228 <strcmp+0x28>
 211:	eb 3a                	jmp    24d <strcmp+0x4d>
 213:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 217:	90                   	nop
 218:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 21c:	83 c2 01             	add    $0x1,%edx
 21f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 222:	84 c0                	test   %al,%al
 224:	74 1a                	je     240 <strcmp+0x40>
    p++, q++;
 226:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 228:	0f b6 19             	movzbl (%ecx),%ebx
 22b:	38 c3                	cmp    %al,%bl
 22d:	74 e9                	je     218 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 22f:	29 d8                	sub    %ebx,%eax
}
 231:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 234:	c9                   	leave  
 235:	c3                   	ret    
 236:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 240:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 244:	31 c0                	xor    %eax,%eax
 246:	29 d8                	sub    %ebx,%eax
}
 248:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 24b:	c9                   	leave  
 24c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 24d:	0f b6 19             	movzbl (%ecx),%ebx
 250:	31 c0                	xor    %eax,%eax
 252:	eb db                	jmp    22f <strcmp+0x2f>
 254:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 25f:	90                   	nop

00000260 <strlen>:

uint
strlen(const char *s)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 266:	80 3a 00             	cmpb   $0x0,(%edx)
 269:	74 15                	je     280 <strlen+0x20>
 26b:	31 c0                	xor    %eax,%eax
 26d:	8d 76 00             	lea    0x0(%esi),%esi
 270:	83 c0 01             	add    $0x1,%eax
 273:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 277:	89 c1                	mov    %eax,%ecx
 279:	75 f5                	jne    270 <strlen+0x10>
    ;
  return n;
}
 27b:	89 c8                	mov    %ecx,%eax
 27d:	5d                   	pop    %ebp
 27e:	c3                   	ret    
 27f:	90                   	nop
  for(n = 0; s[n]; n++)
 280:	31 c9                	xor    %ecx,%ecx
}
 282:	5d                   	pop    %ebp
 283:	89 c8                	mov    %ecx,%eax
 285:	c3                   	ret    
 286:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28d:	8d 76 00             	lea    0x0(%esi),%esi

00000290 <memset>:

void*
memset(void *dst, int c, uint n)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 297:	8b 4d 10             	mov    0x10(%ebp),%ecx
 29a:	8b 45 0c             	mov    0xc(%ebp),%eax
 29d:	89 d7                	mov    %edx,%edi
 29f:	fc                   	cld    
 2a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2a2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2a5:	89 d0                	mov    %edx,%eax
 2a7:	c9                   	leave  
 2a8:	c3                   	ret    
 2a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002b0 <strchr>:

char*
strchr(const char *s, char c)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2ba:	0f b6 10             	movzbl (%eax),%edx
 2bd:	84 d2                	test   %dl,%dl
 2bf:	75 12                	jne    2d3 <strchr+0x23>
 2c1:	eb 1d                	jmp    2e0 <strchr+0x30>
 2c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2c7:	90                   	nop
 2c8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 2cc:	83 c0 01             	add    $0x1,%eax
 2cf:	84 d2                	test   %dl,%dl
 2d1:	74 0d                	je     2e0 <strchr+0x30>
    if(*s == c)
 2d3:	38 d1                	cmp    %dl,%cl
 2d5:	75 f1                	jne    2c8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 2d7:	5d                   	pop    %ebp
 2d8:	c3                   	ret    
 2d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2e0:	31 c0                	xor    %eax,%eax
}
 2e2:	5d                   	pop    %ebp
 2e3:	c3                   	ret    
 2e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ef:	90                   	nop

000002f0 <gets>:

char*
gets(char *buf, int max)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	57                   	push   %edi
 2f4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2f5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 2f8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2f9:	31 db                	xor    %ebx,%ebx
{
 2fb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2fe:	eb 27                	jmp    327 <gets+0x37>
    cc = read(0, &c, 1);
 300:	83 ec 04             	sub    $0x4,%esp
 303:	6a 01                	push   $0x1
 305:	57                   	push   %edi
 306:	6a 00                	push   $0x0
 308:	e8 2e 01 00 00       	call   43b <read>
    if(cc < 1)
 30d:	83 c4 10             	add    $0x10,%esp
 310:	85 c0                	test   %eax,%eax
 312:	7e 1d                	jle    331 <gets+0x41>
      break;
    buf[i++] = c;
 314:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 318:	8b 55 08             	mov    0x8(%ebp),%edx
 31b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 31f:	3c 0a                	cmp    $0xa,%al
 321:	74 1d                	je     340 <gets+0x50>
 323:	3c 0d                	cmp    $0xd,%al
 325:	74 19                	je     340 <gets+0x50>
  for(i=0; i+1 < max; ){
 327:	89 de                	mov    %ebx,%esi
 329:	83 c3 01             	add    $0x1,%ebx
 32c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 32f:	7c cf                	jl     300 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 331:	8b 45 08             	mov    0x8(%ebp),%eax
 334:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 338:	8d 65 f4             	lea    -0xc(%ebp),%esp
 33b:	5b                   	pop    %ebx
 33c:	5e                   	pop    %esi
 33d:	5f                   	pop    %edi
 33e:	5d                   	pop    %ebp
 33f:	c3                   	ret    
  buf[i] = '\0';
 340:	8b 45 08             	mov    0x8(%ebp),%eax
 343:	89 de                	mov    %ebx,%esi
 345:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 349:	8d 65 f4             	lea    -0xc(%ebp),%esp
 34c:	5b                   	pop    %ebx
 34d:	5e                   	pop    %esi
 34e:	5f                   	pop    %edi
 34f:	5d                   	pop    %ebp
 350:	c3                   	ret    
 351:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 358:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop

00000360 <stat>:

int
stat(const char *n, struct stat *st)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	56                   	push   %esi
 364:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 365:	83 ec 08             	sub    $0x8,%esp
 368:	6a 00                	push   $0x0
 36a:	ff 75 08             	push   0x8(%ebp)
 36d:	e8 f1 00 00 00       	call   463 <open>
  if(fd < 0)
 372:	83 c4 10             	add    $0x10,%esp
 375:	85 c0                	test   %eax,%eax
 377:	78 27                	js     3a0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 379:	83 ec 08             	sub    $0x8,%esp
 37c:	ff 75 0c             	push   0xc(%ebp)
 37f:	89 c3                	mov    %eax,%ebx
 381:	50                   	push   %eax
 382:	e8 f4 00 00 00       	call   47b <fstat>
  close(fd);
 387:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 38a:	89 c6                	mov    %eax,%esi
  close(fd);
 38c:	e8 ba 00 00 00       	call   44b <close>
  return r;
 391:	83 c4 10             	add    $0x10,%esp
}
 394:	8d 65 f8             	lea    -0x8(%ebp),%esp
 397:	89 f0                	mov    %esi,%eax
 399:	5b                   	pop    %ebx
 39a:	5e                   	pop    %esi
 39b:	5d                   	pop    %ebp
 39c:	c3                   	ret    
 39d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 3a0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3a5:	eb ed                	jmp    394 <stat+0x34>
 3a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ae:	66 90                	xchg   %ax,%ax

000003b0 <atoi>:

int
atoi(const char *s)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	53                   	push   %ebx
 3b4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3b7:	0f be 02             	movsbl (%edx),%eax
 3ba:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3bd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3c0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3c5:	77 1e                	ja     3e5 <atoi+0x35>
 3c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ce:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 3d0:	83 c2 01             	add    $0x1,%edx
 3d3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3d6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3da:	0f be 02             	movsbl (%edx),%eax
 3dd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3e0:	80 fb 09             	cmp    $0x9,%bl
 3e3:	76 eb                	jbe    3d0 <atoi+0x20>
  return n;
}
 3e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3e8:	89 c8                	mov    %ecx,%eax
 3ea:	c9                   	leave  
 3eb:	c3                   	ret    
 3ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	8b 45 10             	mov    0x10(%ebp),%eax
 3f7:	8b 55 08             	mov    0x8(%ebp),%edx
 3fa:	56                   	push   %esi
 3fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3fe:	85 c0                	test   %eax,%eax
 400:	7e 13                	jle    415 <memmove+0x25>
 402:	01 d0                	add    %edx,%eax
  dst = vdst;
 404:	89 d7                	mov    %edx,%edi
 406:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 410:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 411:	39 f8                	cmp    %edi,%eax
 413:	75 fb                	jne    410 <memmove+0x20>
  return vdst;
}
 415:	5e                   	pop    %esi
 416:	89 d0                	mov    %edx,%eax
 418:	5f                   	pop    %edi
 419:	5d                   	pop    %ebp
 41a:	c3                   	ret    

0000041b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 41b:	b8 01 00 00 00       	mov    $0x1,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <exit>:
SYSCALL(exit)
 423:	b8 02 00 00 00       	mov    $0x2,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <wait>:
SYSCALL(wait)
 42b:	b8 03 00 00 00       	mov    $0x3,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <pipe>:
SYSCALL(pipe)
 433:	b8 04 00 00 00       	mov    $0x4,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <read>:
SYSCALL(read)
 43b:	b8 05 00 00 00       	mov    $0x5,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <write>:
SYSCALL(write)
 443:	b8 10 00 00 00       	mov    $0x10,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <close>:
SYSCALL(close)
 44b:	b8 15 00 00 00       	mov    $0x15,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <kill>:
SYSCALL(kill)
 453:	b8 06 00 00 00       	mov    $0x6,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <exec>:
SYSCALL(exec)
 45b:	b8 07 00 00 00       	mov    $0x7,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <open>:
SYSCALL(open)
 463:	b8 0f 00 00 00       	mov    $0xf,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <mknod>:
SYSCALL(mknod)
 46b:	b8 11 00 00 00       	mov    $0x11,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <unlink>:
SYSCALL(unlink)
 473:	b8 12 00 00 00       	mov    $0x12,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <fstat>:
SYSCALL(fstat)
 47b:	b8 08 00 00 00       	mov    $0x8,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <link>:
SYSCALL(link)
 483:	b8 13 00 00 00       	mov    $0x13,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <mkdir>:
SYSCALL(mkdir)
 48b:	b8 14 00 00 00       	mov    $0x14,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <chdir>:
SYSCALL(chdir)
 493:	b8 09 00 00 00       	mov    $0x9,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <dup>:
SYSCALL(dup)
 49b:	b8 0a 00 00 00       	mov    $0xa,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <getpid>:
SYSCALL(getpid)
 4a3:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <sbrk>:
SYSCALL(sbrk)
 4ab:	b8 0c 00 00 00       	mov    $0xc,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <sleep>:
SYSCALL(sleep)
 4b3:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <uptime>:
SYSCALL(uptime)
 4bb:	b8 0e 00 00 00       	mov    $0xe,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <getreadcount>:
SYSCALL(getreadcount)
 4c3:	b8 16 00 00 00       	mov    $0x16,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <settickets>:
SYSCALL(settickets)
 4cb:	b8 17 00 00 00       	mov    $0x17,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <getpinfo>:
SYSCALL(getpinfo)
 4d3:	b8 18 00 00 00       	mov    $0x18,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    
 4db:	66 90                	xchg   %ax,%ax
 4dd:	66 90                	xchg   %ax,%ax
 4df:	90                   	nop

000004e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
 4e6:	83 ec 3c             	sub    $0x3c,%esp
 4e9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4ec:	89 d1                	mov    %edx,%ecx
{
 4ee:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 4f1:	85 d2                	test   %edx,%edx
 4f3:	0f 89 7f 00 00 00    	jns    578 <printint+0x98>
 4f9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4fd:	74 79                	je     578 <printint+0x98>
    neg = 1;
 4ff:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 506:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 508:	31 db                	xor    %ebx,%ebx
 50a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 50d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 510:	89 c8                	mov    %ecx,%eax
 512:	31 d2                	xor    %edx,%edx
 514:	89 cf                	mov    %ecx,%edi
 516:	f7 75 c4             	divl   -0x3c(%ebp)
 519:	0f b6 92 74 09 00 00 	movzbl 0x974(%edx),%edx
 520:	89 45 c0             	mov    %eax,-0x40(%ebp)
 523:	89 d8                	mov    %ebx,%eax
 525:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 528:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 52b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 52e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 531:	76 dd                	jbe    510 <printint+0x30>
  if(neg)
 533:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 536:	85 c9                	test   %ecx,%ecx
 538:	74 0c                	je     546 <printint+0x66>
    buf[i++] = '-';
 53a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 53f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 541:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 546:	8b 7d b8             	mov    -0x48(%ebp),%edi
 549:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 54d:	eb 07                	jmp    556 <printint+0x76>
 54f:	90                   	nop
    putc(fd, buf[i]);
 550:	0f b6 13             	movzbl (%ebx),%edx
 553:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 556:	83 ec 04             	sub    $0x4,%esp
 559:	88 55 d7             	mov    %dl,-0x29(%ebp)
 55c:	6a 01                	push   $0x1
 55e:	56                   	push   %esi
 55f:	57                   	push   %edi
 560:	e8 de fe ff ff       	call   443 <write>
  while(--i >= 0)
 565:	83 c4 10             	add    $0x10,%esp
 568:	39 de                	cmp    %ebx,%esi
 56a:	75 e4                	jne    550 <printint+0x70>
}
 56c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 56f:	5b                   	pop    %ebx
 570:	5e                   	pop    %esi
 571:	5f                   	pop    %edi
 572:	5d                   	pop    %ebp
 573:	c3                   	ret    
 574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 578:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 57f:	eb 87                	jmp    508 <printint+0x28>
 581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 588:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58f:	90                   	nop

00000590 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	56                   	push   %esi
 595:	53                   	push   %ebx
 596:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 599:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 59c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 59f:	0f b6 13             	movzbl (%ebx),%edx
 5a2:	84 d2                	test   %dl,%dl
 5a4:	74 6a                	je     610 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 5a6:	8d 45 10             	lea    0x10(%ebp),%eax
 5a9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5ac:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5af:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 5b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5b4:	eb 36                	jmp    5ec <printf+0x5c>
 5b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
 5c0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5c3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 5c8:	83 f8 25             	cmp    $0x25,%eax
 5cb:	74 15                	je     5e2 <printf+0x52>
  write(fd, &c, 1);
 5cd:	83 ec 04             	sub    $0x4,%esp
 5d0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5d3:	6a 01                	push   $0x1
 5d5:	57                   	push   %edi
 5d6:	56                   	push   %esi
 5d7:	e8 67 fe ff ff       	call   443 <write>
 5dc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 5df:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5e2:	0f b6 13             	movzbl (%ebx),%edx
 5e5:	83 c3 01             	add    $0x1,%ebx
 5e8:	84 d2                	test   %dl,%dl
 5ea:	74 24                	je     610 <printf+0x80>
    c = fmt[i] & 0xff;
 5ec:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 5ef:	85 c9                	test   %ecx,%ecx
 5f1:	74 cd                	je     5c0 <printf+0x30>
      }
    } else if(state == '%'){
 5f3:	83 f9 25             	cmp    $0x25,%ecx
 5f6:	75 ea                	jne    5e2 <printf+0x52>
      if(c == 'd'){
 5f8:	83 f8 25             	cmp    $0x25,%eax
 5fb:	0f 84 07 01 00 00    	je     708 <printf+0x178>
 601:	83 e8 63             	sub    $0x63,%eax
 604:	83 f8 15             	cmp    $0x15,%eax
 607:	77 17                	ja     620 <printf+0x90>
 609:	ff 24 85 1c 09 00 00 	jmp    *0x91c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 610:	8d 65 f4             	lea    -0xc(%ebp),%esp
 613:	5b                   	pop    %ebx
 614:	5e                   	pop    %esi
 615:	5f                   	pop    %edi
 616:	5d                   	pop    %ebp
 617:	c3                   	ret    
 618:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61f:	90                   	nop
  write(fd, &c, 1);
 620:	83 ec 04             	sub    $0x4,%esp
 623:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 626:	6a 01                	push   $0x1
 628:	57                   	push   %edi
 629:	56                   	push   %esi
 62a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 62e:	e8 10 fe ff ff       	call   443 <write>
        putc(fd, c);
 633:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 637:	83 c4 0c             	add    $0xc,%esp
 63a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 63d:	6a 01                	push   $0x1
 63f:	57                   	push   %edi
 640:	56                   	push   %esi
 641:	e8 fd fd ff ff       	call   443 <write>
        putc(fd, c);
 646:	83 c4 10             	add    $0x10,%esp
      state = 0;
 649:	31 c9                	xor    %ecx,%ecx
 64b:	eb 95                	jmp    5e2 <printf+0x52>
 64d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 650:	83 ec 0c             	sub    $0xc,%esp
 653:	b9 10 00 00 00       	mov    $0x10,%ecx
 658:	6a 00                	push   $0x0
 65a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 65d:	8b 10                	mov    (%eax),%edx
 65f:	89 f0                	mov    %esi,%eax
 661:	e8 7a fe ff ff       	call   4e0 <printint>
        ap++;
 666:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 66a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 66d:	31 c9                	xor    %ecx,%ecx
 66f:	e9 6e ff ff ff       	jmp    5e2 <printf+0x52>
 674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 678:	8b 45 d0             	mov    -0x30(%ebp),%eax
 67b:	8b 10                	mov    (%eax),%edx
        ap++;
 67d:	83 c0 04             	add    $0x4,%eax
 680:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 683:	85 d2                	test   %edx,%edx
 685:	0f 84 8d 00 00 00    	je     718 <printf+0x188>
        while(*s != 0){
 68b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 68e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 690:	84 c0                	test   %al,%al
 692:	0f 84 4a ff ff ff    	je     5e2 <printf+0x52>
 698:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 69b:	89 d3                	mov    %edx,%ebx
 69d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6a0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6a3:	83 c3 01             	add    $0x1,%ebx
 6a6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6a9:	6a 01                	push   $0x1
 6ab:	57                   	push   %edi
 6ac:	56                   	push   %esi
 6ad:	e8 91 fd ff ff       	call   443 <write>
        while(*s != 0){
 6b2:	0f b6 03             	movzbl (%ebx),%eax
 6b5:	83 c4 10             	add    $0x10,%esp
 6b8:	84 c0                	test   %al,%al
 6ba:	75 e4                	jne    6a0 <printf+0x110>
      state = 0;
 6bc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 6bf:	31 c9                	xor    %ecx,%ecx
 6c1:	e9 1c ff ff ff       	jmp    5e2 <printf+0x52>
 6c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6d0:	83 ec 0c             	sub    $0xc,%esp
 6d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6d8:	6a 01                	push   $0x1
 6da:	e9 7b ff ff ff       	jmp    65a <printf+0xca>
 6df:	90                   	nop
        putc(fd, *ap);
 6e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 6e3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6e6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 6e8:	6a 01                	push   $0x1
 6ea:	57                   	push   %edi
 6eb:	56                   	push   %esi
        putc(fd, *ap);
 6ec:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6ef:	e8 4f fd ff ff       	call   443 <write>
        ap++;
 6f4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6f8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6fb:	31 c9                	xor    %ecx,%ecx
 6fd:	e9 e0 fe ff ff       	jmp    5e2 <printf+0x52>
 702:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 708:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 70b:	83 ec 04             	sub    $0x4,%esp
 70e:	e9 2a ff ff ff       	jmp    63d <printf+0xad>
 713:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 717:	90                   	nop
          s = "(null)";
 718:	ba 14 09 00 00       	mov    $0x914,%edx
        while(*s != 0){
 71d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 720:	b8 28 00 00 00       	mov    $0x28,%eax
 725:	89 d3                	mov    %edx,%ebx
 727:	e9 74 ff ff ff       	jmp    6a0 <printf+0x110>
 72c:	66 90                	xchg   %ax,%ax
 72e:	66 90                	xchg   %ax,%ax

00000730 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 730:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 731:	a1 3c 0c 00 00       	mov    0xc3c,%eax
{
 736:	89 e5                	mov    %esp,%ebp
 738:	57                   	push   %edi
 739:	56                   	push   %esi
 73a:	53                   	push   %ebx
 73b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 73e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 748:	89 c2                	mov    %eax,%edx
 74a:	8b 00                	mov    (%eax),%eax
 74c:	39 ca                	cmp    %ecx,%edx
 74e:	73 30                	jae    780 <free+0x50>
 750:	39 c1                	cmp    %eax,%ecx
 752:	72 04                	jb     758 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 754:	39 c2                	cmp    %eax,%edx
 756:	72 f0                	jb     748 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 758:	8b 73 fc             	mov    -0x4(%ebx),%esi
 75b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 75e:	39 f8                	cmp    %edi,%eax
 760:	74 30                	je     792 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 762:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 765:	8b 42 04             	mov    0x4(%edx),%eax
 768:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 76b:	39 f1                	cmp    %esi,%ecx
 76d:	74 3a                	je     7a9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 76f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 771:	5b                   	pop    %ebx
  freep = p;
 772:	89 15 3c 0c 00 00    	mov    %edx,0xc3c
}
 778:	5e                   	pop    %esi
 779:	5f                   	pop    %edi
 77a:	5d                   	pop    %ebp
 77b:	c3                   	ret    
 77c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 780:	39 c2                	cmp    %eax,%edx
 782:	72 c4                	jb     748 <free+0x18>
 784:	39 c1                	cmp    %eax,%ecx
 786:	73 c0                	jae    748 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 788:	8b 73 fc             	mov    -0x4(%ebx),%esi
 78b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 78e:	39 f8                	cmp    %edi,%eax
 790:	75 d0                	jne    762 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 792:	03 70 04             	add    0x4(%eax),%esi
 795:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 798:	8b 02                	mov    (%edx),%eax
 79a:	8b 00                	mov    (%eax),%eax
 79c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 79f:	8b 42 04             	mov    0x4(%edx),%eax
 7a2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7a5:	39 f1                	cmp    %esi,%ecx
 7a7:	75 c6                	jne    76f <free+0x3f>
    p->s.size += bp->s.size;
 7a9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 7ac:	89 15 3c 0c 00 00    	mov    %edx,0xc3c
    p->s.size += bp->s.size;
 7b2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 7b5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7b8:	89 0a                	mov    %ecx,(%edx)
}
 7ba:	5b                   	pop    %ebx
 7bb:	5e                   	pop    %esi
 7bc:	5f                   	pop    %edi
 7bd:	5d                   	pop    %ebp
 7be:	c3                   	ret    
 7bf:	90                   	nop

000007c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	57                   	push   %edi
 7c4:	56                   	push   %esi
 7c5:	53                   	push   %ebx
 7c6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7cc:	8b 3d 3c 0c 00 00    	mov    0xc3c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d2:	8d 70 07             	lea    0x7(%eax),%esi
 7d5:	c1 ee 03             	shr    $0x3,%esi
 7d8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7db:	85 ff                	test   %edi,%edi
 7dd:	0f 84 9d 00 00 00    	je     880 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 7e5:	8b 4a 04             	mov    0x4(%edx),%ecx
 7e8:	39 f1                	cmp    %esi,%ecx
 7ea:	73 6a                	jae    856 <malloc+0x96>
 7ec:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7f1:	39 de                	cmp    %ebx,%esi
 7f3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 7f6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7fd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 800:	eb 17                	jmp    819 <malloc+0x59>
 802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 808:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 80a:	8b 48 04             	mov    0x4(%eax),%ecx
 80d:	39 f1                	cmp    %esi,%ecx
 80f:	73 4f                	jae    860 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 811:	8b 3d 3c 0c 00 00    	mov    0xc3c,%edi
 817:	89 c2                	mov    %eax,%edx
 819:	39 d7                	cmp    %edx,%edi
 81b:	75 eb                	jne    808 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 81d:	83 ec 0c             	sub    $0xc,%esp
 820:	ff 75 e4             	push   -0x1c(%ebp)
 823:	e8 83 fc ff ff       	call   4ab <sbrk>
  if(p == (char*)-1)
 828:	83 c4 10             	add    $0x10,%esp
 82b:	83 f8 ff             	cmp    $0xffffffff,%eax
 82e:	74 1c                	je     84c <malloc+0x8c>
  hp->s.size = nu;
 830:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 833:	83 ec 0c             	sub    $0xc,%esp
 836:	83 c0 08             	add    $0x8,%eax
 839:	50                   	push   %eax
 83a:	e8 f1 fe ff ff       	call   730 <free>
  return freep;
 83f:	8b 15 3c 0c 00 00    	mov    0xc3c,%edx
      if((p = morecore(nunits)) == 0)
 845:	83 c4 10             	add    $0x10,%esp
 848:	85 d2                	test   %edx,%edx
 84a:	75 bc                	jne    808 <malloc+0x48>
        return 0;
  }
}
 84c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 84f:	31 c0                	xor    %eax,%eax
}
 851:	5b                   	pop    %ebx
 852:	5e                   	pop    %esi
 853:	5f                   	pop    %edi
 854:	5d                   	pop    %ebp
 855:	c3                   	ret    
    if(p->s.size >= nunits){
 856:	89 d0                	mov    %edx,%eax
 858:	89 fa                	mov    %edi,%edx
 85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 860:	39 ce                	cmp    %ecx,%esi
 862:	74 4c                	je     8b0 <malloc+0xf0>
        p->s.size -= nunits;
 864:	29 f1                	sub    %esi,%ecx
 866:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 869:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 86c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 86f:	89 15 3c 0c 00 00    	mov    %edx,0xc3c
}
 875:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 878:	83 c0 08             	add    $0x8,%eax
}
 87b:	5b                   	pop    %ebx
 87c:	5e                   	pop    %esi
 87d:	5f                   	pop    %edi
 87e:	5d                   	pop    %ebp
 87f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 880:	c7 05 3c 0c 00 00 40 	movl   $0xc40,0xc3c
 887:	0c 00 00 
    base.s.size = 0;
 88a:	bf 40 0c 00 00       	mov    $0xc40,%edi
    base.s.ptr = freep = prevp = &base;
 88f:	c7 05 40 0c 00 00 40 	movl   $0xc40,0xc40
 896:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 899:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 89b:	c7 05 44 0c 00 00 00 	movl   $0x0,0xc44
 8a2:	00 00 00 
    if(p->s.size >= nunits){
 8a5:	e9 42 ff ff ff       	jmp    7ec <malloc+0x2c>
 8aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8b0:	8b 08                	mov    (%eax),%ecx
 8b2:	89 0a                	mov    %ecx,(%edx)
 8b4:	eb b9                	jmp    86f <malloc+0xaf>
