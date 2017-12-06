  400e41:	55                   	push   %rbp
  400e42:	48 89 e5             	mov    %rsp,%rbp
  400e45:	48 81 ec 30 09 3d 00 	sub    $0x3d0930,%rsp
  400e4c:	48 89 bd d8 f6 c2 ff 	mov    %rdi,-0x3d0928(%rbp)
  400e53:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  400e57:	be 01 00 00 00       	mov    $0x1,%esi
  400e5c:	48 89 c7             	mov    %rax,%rdi
  400e5f:	e8 68 1c 00 00       	callq  402acc <_ZNSt26linear_congruential_engineImLm16807ELm0ELm2147483647EEC1Em>
  400e64:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400e68:	ba 40 42 0f 00       	mov    $0xf4240,%edx
  400e6d:	be 00 00 00 00       	mov    $0x0,%esi
  400e72:	48 89 c7             	mov    %rax,%rdi
  400e75:	e8 78 1c 00 00       	callq  402af2 <_ZNSt24uniform_int_distributionIiEC1Eii>
  400e7a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  400e81:	eb 23                	jmp    400ea6 <_Z11dcache_missPv+0x65>
  400e83:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  400e87:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400e8b:	48 89 d6             	mov    %rdx,%rsi
  400e8e:	48 89 c7             	mov    %rax,%rdi
  400e91:	e8 84 1c 00 00       	callq  402b1a <_ZNSt24uniform_int_distributionIiEclISt26linear_congruential_engineImLm16807ELm0ELm2147483647EEEEiRT_>
  400e96:	48 98                	cltq   
  400e98:	8b 55 fc             	mov    -0x4(%rbp),%edx
  400e9b:	89 94 85 e0 f6 c2 ff 	mov    %edx,-0x3d0920(%rbp,%rax,4)
  400ea2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  400ea6:	81 7d fc 1f 4e 00 00 	cmpl   $0x4e1f,-0x4(%rbp)
  400ead:	7e d4                	jle    400e83 <_Z11dcache_missPv+0x42>
  400eaf:	c9                   	leaveq 
  400eb0:	c3                   	retq   

