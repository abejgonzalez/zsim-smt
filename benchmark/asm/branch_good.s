  400cbc:	55                   	push   %rbp
  400cbd:	48 89 e5             	mov    %rsp,%rbp
  400cc0:	48 81 ec 70 9c 00 00 	sub    $0x9c70,%rsp
  400cc7:	48 89 bd 98 63 ff ff 	mov    %rdi,-0x9c68(%rbp)
  400cce:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  400cd5:	eb 20                	jmp    400cf7 <_Z11branch_goodPv+0x3b>
  400cd7:	e8 a4 fa ff ff       	callq  400780 <rand@plt>
  400cdc:	99                   	cltd   
  400cdd:	c1 ea 18             	shr    $0x18,%edx
  400ce0:	01 d0                	add    %edx,%eax
  400ce2:	0f b6 c0             	movzbl %al,%eax
  400ce5:	29 d0                	sub    %edx,%eax
  400ce7:	89 c2                	mov    %eax,%edx
  400ce9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400cec:	89 94 85 a0 63 ff ff 	mov    %edx,-0x9c60(%rbp,%rax,4)
  400cf3:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  400cf7:	81 7d fc 0f 27 00 00 	cmpl   $0x270f,-0x4(%rbp)
  400cfe:	76 d7                	jbe    400cd7 <_Z11branch_goodPv+0x1b>
  400d00:	48 8d 85 a0 63 ff ff 	lea    -0x9c60(%rbp),%rax
  400d07:	48 8d 90 40 9c 00 00 	lea    0x9c40(%rax),%rdx
  400d0e:	48 8d 85 a0 63 ff ff 	lea    -0x9c60(%rbp),%rax
  400d15:	48 89 d6             	mov    %rdx,%rsi
  400d18:	48 89 c7             	mov    %rax,%rdi
  400d1b:	e8 4c 1d 00 00       	callq  402a6c <_ZSt4sortIPiEvT_S1_>
  400d20:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  400d27:	00 
  400d28:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  400d2f:	eb 39                	jmp    400d6a <_Z11branch_goodPv+0xae>
  400d31:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
  400d38:	eb 23                	jmp    400d5d <_Z11branch_goodPv+0xa1>
  400d3a:	8b 45 e8             	mov    -0x18(%rbp),%eax
  400d3d:	8b 84 85 a0 63 ff ff 	mov    -0x9c60(%rbp,%rax,4),%eax
  400d44:	83 f8 7f             	cmp    $0x7f,%eax
  400d47:	7e 10                	jle    400d59 <_Z11branch_goodPv+0x9d>
  400d49:	8b 45 e8             	mov    -0x18(%rbp),%eax
  400d4c:	8b 84 85 a0 63 ff ff 	mov    -0x9c60(%rbp,%rax,4),%eax
  400d53:	48 98                	cltq   
  400d55:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  400d59:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
  400d5d:	81 7d e8 0f 27 00 00 	cmpl   $0x270f,-0x18(%rbp)
  400d64:	76 d4                	jbe    400d3a <_Z11branch_goodPv+0x7e>
  400d66:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
  400d6a:	83 7d ec 63          	cmpl   $0x63,-0x14(%rbp)
  400d6e:	76 c1                	jbe    400d31 <_Z11branch_goodPv+0x75>
  400d70:	c9                   	leaveq 
  400d71:	c3                   	retq   

