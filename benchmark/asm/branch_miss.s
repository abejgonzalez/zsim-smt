  400d72:	55                   	push   %rbp
  400d73:	48 89 e5             	mov    %rsp,%rbp
  400d76:	48 81 ec 70 9c 00 00 	sub    $0x9c70,%rsp
  400d7d:	48 89 bd 98 63 ff ff 	mov    %rdi,-0x9c68(%rbp)
  400d84:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  400d8b:	eb 20                	jmp    400dad <_Z11branch_missPv+0x3b>
  400d8d:	e8 ee f9 ff ff       	callq  400780 <rand@plt>
  400d92:	99                   	cltd   
  400d93:	c1 ea 18             	shr    $0x18,%edx
  400d96:	01 d0                	add    %edx,%eax
  400d98:	0f b6 c0             	movzbl %al,%eax
  400d9b:	29 d0                	sub    %edx,%eax
  400d9d:	89 c2                	mov    %eax,%edx
  400d9f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400da2:	89 94 85 a0 63 ff ff 	mov    %edx,-0x9c60(%rbp,%rax,4)
  400da9:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  400dad:	81 7d fc 0f 27 00 00 	cmpl   $0x270f,-0x4(%rbp)
  400db4:	76 d7                	jbe    400d8d <_Z11branch_missPv+0x1b>
  400db6:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  400dbd:	00 
  400dbe:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  400dc5:	eb 39                	jmp    400e00 <_Z11branch_missPv+0x8e>
  400dc7:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
  400dce:	eb 23                	jmp    400df3 <_Z11branch_missPv+0x81>
  400dd0:	8b 45 e8             	mov    -0x18(%rbp),%eax
  400dd3:	8b 84 85 a0 63 ff ff 	mov    -0x9c60(%rbp,%rax,4),%eax
  400dda:	83 f8 7f             	cmp    $0x7f,%eax
  400ddd:	7e 10                	jle    400def <_Z11branch_missPv+0x7d>
  400ddf:	8b 45 e8             	mov    -0x18(%rbp),%eax
  400de2:	8b 84 85 a0 63 ff ff 	mov    -0x9c60(%rbp,%rax,4),%eax
  400de9:	48 98                	cltq   
  400deb:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  400def:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
  400df3:	81 7d e8 0f 27 00 00 	cmpl   $0x270f,-0x18(%rbp)
  400dfa:	76 d4                	jbe    400dd0 <_Z11branch_missPv+0x5e>
  400dfc:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
  400e00:	83 7d ec 63          	cmpl   $0x63,-0x14(%rbp)
  400e04:	76 c1                	jbe    400dc7 <_Z11branch_missPv+0x55>
  400e06:	c9                   	leaveq 
  400e07:	c3                   	retq   

