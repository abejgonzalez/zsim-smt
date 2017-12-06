  400e08:	55                   	push   %rbp
  400e09:	48 89 e5             	mov    %rsp,%rbp
  400e0c:	48 81 ec a0 08 3d 00 	sub    $0x3d08a0,%rsp
  400e13:	48 89 bd e8 f6 c2 ff 	mov    %rdi,-0x3d0918(%rbp)
  400e1a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  400e21:	eb 13                	jmp    400e36 <_Z11dcache_goodPv+0x2e>
  400e23:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400e26:	48 98                	cltq   
  400e28:	8b 55 fc             	mov    -0x4(%rbp),%edx
  400e2b:	89 94 85 f0 f6 c2 ff 	mov    %edx,-0x3d0910(%rbp,%rax,4)
  400e32:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  400e36:	81 7d fc 1f 4e 00 00 	cmpl   $0x4e1f,-0x4(%rbp)
  400e3d:	7e e4                	jle    400e23 <_Z11dcache_goodPv+0x1b>
  400e3f:	c9                   	leaveq 
  400e40:	c3                   	retq   

