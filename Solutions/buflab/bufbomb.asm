
./bufbomb:     file format elf32-i386


Disassembly of section .init:

08048750 <_init>:
 8048750:	55                   	push   %ebp
 8048751:	89 e5                	mov    %esp,%ebp
 8048753:	83 ec 08             	sub    $0x8,%esp
 8048756:	e8 29 02 00 00       	call   8048984 <call_gmon_start>
 804875b:	e8 80 02 00 00       	call   80489e0 <frame_dummy>
 8048760:	e8 7b 0e 00 00       	call   80495e0 <__do_global_ctors_aux>
 8048765:	c9                   	leave  
 8048766:	c3                   	ret    

Disassembly of section .plt:

08048768 <sprintf@plt-0x10>:
 8048768:	ff 35 e4 a0 04 08    	pushl  0x804a0e4
 804876e:	ff 25 e8 a0 04 08    	jmp    *0x804a0e8
 8048774:	00 00                	add    %al,(%eax)
	...

08048778 <sprintf@plt>:
 8048778:	ff 25 ec a0 04 08    	jmp    *0x804a0ec
 804877e:	68 00 00 00 00       	push   $0x0
 8048783:	e9 e0 ff ff ff       	jmp    8048768 <_init+0x18>

08048788 <srand@plt>:
 8048788:	ff 25 f0 a0 04 08    	jmp    *0x804a0f0
 804878e:	68 08 00 00 00       	push   $0x8
 8048793:	e9 d0 ff ff ff       	jmp    8048768 <_init+0x18>

08048798 <mmap@plt>:
 8048798:	ff 25 f4 a0 04 08    	jmp    *0x804a0f4
 804879e:	68 10 00 00 00       	push   $0x10
 80487a3:	e9 c0 ff ff ff       	jmp    8048768 <_init+0x18>

080487a8 <random@plt>:
 80487a8:	ff 25 f8 a0 04 08    	jmp    *0x804a0f8
 80487ae:	68 18 00 00 00       	push   $0x18
 80487b3:	e9 b0 ff ff ff       	jmp    8048768 <_init+0x18>

080487b8 <signal@plt>:
 80487b8:	ff 25 fc a0 04 08    	jmp    *0x804a0fc
 80487be:	68 20 00 00 00       	push   $0x20
 80487c3:	e9 a0 ff ff ff       	jmp    8048768 <_init+0x18>

080487c8 <__gmon_start__@plt>:
 80487c8:	ff 25 00 a1 04 08    	jmp    *0x804a100
 80487ce:	68 28 00 00 00       	push   $0x28
 80487d3:	e9 90 ff ff ff       	jmp    8048768 <_init+0x18>

080487d8 <calloc@plt>:
 80487d8:	ff 25 04 a1 04 08    	jmp    *0x804a104
 80487de:	68 30 00 00 00       	push   $0x30
 80487e3:	e9 80 ff ff ff       	jmp    8048768 <_init+0x18>

080487e8 <system@plt>:
 80487e8:	ff 25 08 a1 04 08    	jmp    *0x804a108
 80487ee:	68 38 00 00 00       	push   $0x38
 80487f3:	e9 70 ff ff ff       	jmp    8048768 <_init+0x18>

080487f8 <memset@plt>:
 80487f8:	ff 25 0c a1 04 08    	jmp    *0x804a10c
 80487fe:	68 40 00 00 00       	push   $0x40
 8048803:	e9 60 ff ff ff       	jmp    8048768 <_init+0x18>

08048808 <__libc_start_main@plt>:
 8048808:	ff 25 10 a1 04 08    	jmp    *0x804a110
 804880e:	68 48 00 00 00       	push   $0x48
 8048813:	e9 50 ff ff ff       	jmp    8048768 <_init+0x18>

08048818 <_IO_getc@plt>:
 8048818:	ff 25 14 a1 04 08    	jmp    *0x804a114
 804881e:	68 50 00 00 00       	push   $0x50
 8048823:	e9 40 ff ff ff       	jmp    8048768 <_init+0x18>

08048828 <__ctype_b_loc@plt>:
 8048828:	ff 25 18 a1 04 08    	jmp    *0x804a118
 804882e:	68 58 00 00 00       	push   $0x58
 8048833:	e9 30 ff ff ff       	jmp    8048768 <_init+0x18>

08048838 <fclose@plt>:
 8048838:	ff 25 1c a1 04 08    	jmp    *0x804a11c
 804883e:	68 60 00 00 00       	push   $0x60
 8048843:	e9 20 ff ff ff       	jmp    8048768 <_init+0x18>

08048848 <getopt@plt>:
 8048848:	ff 25 20 a1 04 08    	jmp    *0x804a120
 804884e:	68 68 00 00 00       	push   $0x68
 8048853:	e9 10 ff ff ff       	jmp    8048768 <_init+0x18>

08048858 <fopen@plt>:
 8048858:	ff 25 24 a1 04 08    	jmp    *0x804a124
 804885e:	68 70 00 00 00       	push   $0x70
 8048863:	e9 00 ff ff ff       	jmp    8048768 <_init+0x18>

08048868 <alarm@plt>:
 8048868:	ff 25 28 a1 04 08    	jmp    *0x804a128
 804886e:	68 78 00 00 00       	push   $0x78
 8048873:	e9 f0 fe ff ff       	jmp    8048768 <_init+0x18>

08048878 <strcpy@plt>:
 8048878:	ff 25 2c a1 04 08    	jmp    *0x804a12c
 804887e:	68 80 00 00 00       	push   $0x80
 8048883:	e9 e0 fe ff ff       	jmp    8048768 <_init+0x18>

08048888 <printf@plt>:
 8048888:	ff 25 30 a1 04 08    	jmp    *0x804a130
 804888e:	68 88 00 00 00       	push   $0x88
 8048893:	e9 d0 fe ff ff       	jmp    8048768 <_init+0x18>

08048898 <srandom@plt>:
 8048898:	ff 25 34 a1 04 08    	jmp    *0x804a134
 804889e:	68 90 00 00 00       	push   $0x90
 80488a3:	e9 c0 fe ff ff       	jmp    8048768 <_init+0x18>

080488a8 <fwrite@plt>:
 80488a8:	ff 25 38 a1 04 08    	jmp    *0x804a138
 80488ae:	68 98 00 00 00       	push   $0x98
 80488b3:	e9 b0 fe ff ff       	jmp    8048768 <_init+0x18>

080488b8 <fprintf@plt>:
 80488b8:	ff 25 3c a1 04 08    	jmp    *0x804a13c
 80488be:	68 a0 00 00 00       	push   $0xa0
 80488c3:	e9 a0 fe ff ff       	jmp    8048768 <_init+0x18>

080488c8 <remove@plt>:
 80488c8:	ff 25 40 a1 04 08    	jmp    *0x804a140
 80488ce:	68 a8 00 00 00       	push   $0xa8
 80488d3:	e9 90 fe ff ff       	jmp    8048768 <_init+0x18>

080488d8 <cuserid@plt>:
 80488d8:	ff 25 44 a1 04 08    	jmp    *0x804a144
 80488de:	68 b0 00 00 00       	push   $0xb0
 80488e3:	e9 80 fe ff ff       	jmp    8048768 <_init+0x18>

080488e8 <fputc@plt>:
 80488e8:	ff 25 48 a1 04 08    	jmp    *0x804a148
 80488ee:	68 b8 00 00 00       	push   $0xb8
 80488f3:	e9 70 fe ff ff       	jmp    8048768 <_init+0x18>

080488f8 <puts@plt>:
 80488f8:	ff 25 4c a1 04 08    	jmp    *0x804a14c
 80488fe:	68 c0 00 00 00       	push   $0xc0
 8048903:	e9 60 fe ff ff       	jmp    8048768 <_init+0x18>

08048908 <rand@plt>:
 8048908:	ff 25 50 a1 04 08    	jmp    *0x804a150
 804890e:	68 c8 00 00 00       	push   $0xc8
 8048913:	e9 50 fe ff ff       	jmp    8048768 <_init+0x18>

08048918 <munmap@plt>:
 8048918:	ff 25 54 a1 04 08    	jmp    *0x804a154
 804891e:	68 d0 00 00 00       	push   $0xd0
 8048923:	e9 40 fe ff ff       	jmp    8048768 <_init+0x18>

08048928 <tempnam@plt>:
 8048928:	ff 25 58 a1 04 08    	jmp    *0x804a158
 804892e:	68 d8 00 00 00       	push   $0xd8
 8048933:	e9 30 fe ff ff       	jmp    8048768 <_init+0x18>

08048938 <__strdup@plt>:
 8048938:	ff 25 5c a1 04 08    	jmp    *0x804a15c
 804893e:	68 e0 00 00 00       	push   $0xe0
 8048943:	e9 20 fe ff ff       	jmp    8048768 <_init+0x18>

08048948 <exit@plt>:
 8048948:	ff 25 60 a1 04 08    	jmp    *0x804a160
 804894e:	68 e8 00 00 00       	push   $0xe8
 8048953:	e9 10 fe ff ff       	jmp    8048768 <_init+0x18>

Disassembly of section .text:

08048960 <_start>:
 8048960:	31 ed                	xor    %ebp,%ebp
 8048962:	5e                   	pop    %esi
 8048963:	89 e1                	mov    %esp,%ecx
 8048965:	83 e4 f0             	and    $0xfffffff0,%esp
 8048968:	50                   	push   %eax
 8048969:	54                   	push   %esp
 804896a:	52                   	push   %edx
 804896b:	68 60 95 04 08       	push   $0x8049560
 8048970:	68 70 95 04 08       	push   $0x8049570
 8048975:	51                   	push   %ecx
 8048976:	56                   	push   %esi
 8048977:	68 36 92 04 08       	push   $0x8049236
 804897c:	e8 87 fe ff ff       	call   8048808 <__libc_start_main@plt>
 8048981:	f4                   	hlt    
 8048982:	90                   	nop
 8048983:	90                   	nop

08048984 <call_gmon_start>:
 8048984:	55                   	push   %ebp
 8048985:	89 e5                	mov    %esp,%ebp
 8048987:	53                   	push   %ebx
 8048988:	83 ec 04             	sub    $0x4,%esp
 804898b:	e8 00 00 00 00       	call   8048990 <call_gmon_start+0xc>
 8048990:	5b                   	pop    %ebx
 8048991:	81 c3 50 17 00 00    	add    $0x1750,%ebx
 8048997:	8b 93 fc ff ff ff    	mov    -0x4(%ebx),%edx
 804899d:	85 d2                	test   %edx,%edx
 804899f:	74 05                	je     80489a6 <call_gmon_start+0x22>
 80489a1:	e8 22 fe ff ff       	call   80487c8 <__gmon_start__@plt>
 80489a6:	58                   	pop    %eax
 80489a7:	5b                   	pop    %ebx
 80489a8:	c9                   	leave  
 80489a9:	c3                   	ret    
 80489aa:	90                   	nop
 80489ab:	90                   	nop
 80489ac:	90                   	nop
 80489ad:	90                   	nop
 80489ae:	90                   	nop
 80489af:	90                   	nop

080489b0 <__do_global_dtors_aux>:
 80489b0:	55                   	push   %ebp
 80489b1:	89 e5                	mov    %esp,%ebp
 80489b3:	83 ec 08             	sub    $0x8,%esp
 80489b6:	80 3d b0 a1 04 08 00 	cmpb   $0x0,0x804a1b0
 80489bd:	74 0c                	je     80489cb <__do_global_dtors_aux+0x1b>
 80489bf:	eb 1c                	jmp    80489dd <__do_global_dtors_aux+0x2d>
 80489c1:	83 c0 04             	add    $0x4,%eax
 80489c4:	a3 6c a1 04 08       	mov    %eax,0x804a16c
 80489c9:	ff d2                	call   *%edx
 80489cb:	a1 6c a1 04 08       	mov    0x804a16c,%eax
 80489d0:	8b 10                	mov    (%eax),%edx
 80489d2:	85 d2                	test   %edx,%edx
 80489d4:	75 eb                	jne    80489c1 <__do_global_dtors_aux+0x11>
 80489d6:	c6 05 b0 a1 04 08 01 	movb   $0x1,0x804a1b0
 80489dd:	c9                   	leave  
 80489de:	c3                   	ret    
 80489df:	90                   	nop

080489e0 <frame_dummy>:
 80489e0:	55                   	push   %ebp
 80489e1:	89 e5                	mov    %esp,%ebp
 80489e3:	83 ec 08             	sub    $0x8,%esp
 80489e6:	a1 10 a0 04 08       	mov    0x804a010,%eax
 80489eb:	85 c0                	test   %eax,%eax
 80489ed:	74 12                	je     8048a01 <frame_dummy+0x21>
 80489ef:	b8 00 00 00 00       	mov    $0x0,%eax
 80489f4:	85 c0                	test   %eax,%eax
 80489f6:	74 09                	je     8048a01 <frame_dummy+0x21>
 80489f8:	c7 04 24 10 a0 04 08 	movl   $0x804a010,(%esp)
 80489ff:	ff d0                	call   *%eax
 8048a01:	c9                   	leave  
 8048a02:	c3                   	ret    
 8048a03:	90                   	nop
 8048a04:	90                   	nop
 8048a05:	90                   	nop
 8048a06:	90                   	nop
 8048a07:	90                   	nop
 8048a08:	90                   	nop
 8048a09:	90                   	nop
 8048a0a:	90                   	nop
 8048a0b:	90                   	nop
 8048a0c:	90                   	nop
 8048a0d:	90                   	nop
 8048a0e:	90                   	nop
 8048a0f:	90                   	nop

08048a10 <smoke>:
 8048a10:	55                   	push   %ebp
 8048a11:	89 e5                	mov    %esp,%ebp
 8048a13:	83 ec 08             	sub    $0x8,%esp
 8048a16:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048a1d:	e8 2d 03 00 00       	call   8048d4f <entry_check>
 8048a22:	c7 04 24 2c 96 04 08 	movl   $0x804962c,(%esp)
 8048a29:	e8 ca fe ff ff       	call   80488f8 <puts@plt>
 8048a2e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048a35:	e8 22 03 00 00       	call   8048d5c <validate>
 8048a3a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048a41:	e8 02 ff ff ff       	call   8048948 <exit@plt>

08048a46 <fizz>:
 8048a46:	55                   	push   %ebp
 8048a47:	89 e5                	mov    %esp,%ebp
 8048a49:	53                   	push   %ebx
 8048a4a:	83 ec 14             	sub    $0x14,%esp
 8048a4d:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8048a50:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048a57:	e8 f3 02 00 00       	call   8048d4f <entry_check>
 8048a5c:	3b 1d d0 a1 04 08    	cmp    0x804a1d0,%ebx
 8048a62:	75 1e                	jne    8048a82 <fizz+0x3c>
 8048a64:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 8048a68:	c7 04 24 47 96 04 08 	movl   $0x8049647,(%esp)
 8048a6f:	e8 14 fe ff ff       	call   8048888 <printf@plt>
 8048a74:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048a7b:	e8 dc 02 00 00       	call   8048d5c <validate>
 8048a80:	eb 10                	jmp    8048a92 <fizz+0x4c>
 8048a82:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 8048a86:	c7 04 24 20 98 04 08 	movl   $0x8049820,(%esp)
 8048a8d:	e8 f6 fd ff ff       	call   8048888 <printf@plt>
 8048a92:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048a99:	e8 aa fe ff ff       	call   8048948 <exit@plt>

08048a9e <bang>:
 8048a9e:	55                   	push   %ebp
 8048a9f:	89 e5                	mov    %esp,%ebp
 8048aa1:	83 ec 08             	sub    $0x8,%esp
 8048aa4:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8048aab:	e8 9f 02 00 00       	call   8048d4f <entry_check>
 8048ab0:	a1 e0 a1 04 08       	mov    0x804a1e0,%eax
 8048ab5:	3b 05 d0 a1 04 08    	cmp    0x804a1d0,%eax
 8048abb:	75 1e                	jne    8048adb <bang+0x3d>
 8048abd:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048ac1:	c7 04 24 40 98 04 08 	movl   $0x8049840,(%esp)
 8048ac8:	e8 bb fd ff ff       	call   8048888 <printf@plt>
 8048acd:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8048ad4:	e8 83 02 00 00       	call   8048d5c <validate>
 8048ad9:	eb 15                	jmp    8048af0 <bang+0x52>
 8048adb:	a1 e0 a1 04 08       	mov    0x804a1e0,%eax
 8048ae0:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048ae4:	c7 04 24 65 96 04 08 	movl   $0x8049665,(%esp)
 8048aeb:	e8 98 fd ff ff       	call   8048888 <printf@plt>
 8048af0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048af7:	e8 4c fe ff ff       	call   8048948 <exit@plt>

08048afc <test>:
 8048afc:	55                   	push   %ebp
 8048afd:	89 e5                	mov    %esp,%ebp
 8048aff:	83 ec 18             	sub    $0x18,%esp
 8048b02:	c7 45 fc ef be ad de 	movl   $0xdeadbeef,-0x4(%ebp)
 8048b09:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 8048b10:	e8 3a 02 00 00       	call   8048d4f <entry_check>
 8048b15:	e8 52 00 00 00       	call   8048b6c <getbuf>
 8048b1a:	89 c2                	mov    %eax,%edx
 8048b1c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048b1f:	3d ef be ad de       	cmp    $0xdeadbeef,%eax
 8048b24:	74 0e                	je     8048b34 <test+0x38>
 8048b26:	c7 04 24 68 98 04 08 	movl   $0x8049868,(%esp)
 8048b2d:	e8 c6 fd ff ff       	call   80488f8 <puts@plt>
 8048b32:	eb 36                	jmp    8048b6a <test+0x6e>
 8048b34:	3b 15 d0 a1 04 08    	cmp    0x804a1d0,%edx
 8048b3a:	75 1e                	jne    8048b5a <test+0x5e>
 8048b3c:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048b40:	c7 04 24 83 96 04 08 	movl   $0x8049683,(%esp)
 8048b47:	e8 3c fd ff ff       	call   8048888 <printf@plt>
 8048b4c:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 8048b53:	e8 04 02 00 00       	call   8048d5c <validate>
 8048b58:	eb 10                	jmp    8048b6a <test+0x6e>
 8048b5a:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048b5e:	c7 04 24 a0 96 04 08 	movl   $0x80496a0,(%esp)
 8048b65:	e8 1e fd ff ff       	call   8048888 <printf@plt>
 8048b6a:	c9                   	leave  
 8048b6b:	c3                   	ret    

08048b6c <getbuf>:
 8048b6c:	55                   	push   %ebp
 8048b6d:	89 e5                	mov    %esp,%ebp
 8048b6f:	83 ec 28             	sub    $0x28,%esp
 8048b72:	8d 45 e8             	lea    -0x18(%ebp),%eax
 8048b75:	89 04 24             	mov    %eax,(%esp)
 8048b78:	e8 fe 00 00 00       	call   8048c7b <Gets>
 8048b7d:	b8 01 00 00 00       	mov    $0x1,%eax
 8048b82:	c9                   	leave  
 8048b83:	c3                   	ret    

08048b84 <getbufn>:
 8048b84:	55                   	push   %ebp
 8048b85:	89 e5                	mov    %esp,%ebp
 8048b87:	81 ec 18 01 00 00    	sub    $0x118,%esp
 8048b8d:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
 8048b93:	89 04 24             	mov    %eax,(%esp)
 8048b96:	e8 e0 00 00 00       	call   8048c7b <Gets>
 8048b9b:	b8 01 00 00 00       	mov    $0x1,%eax
 8048ba0:	c9                   	leave  
 8048ba1:	c3                   	ret    

08048ba2 <testn>:
 8048ba2:	55                   	push   %ebp
 8048ba3:	89 e5                	mov    %esp,%ebp
 8048ba5:	83 ec 18             	sub    $0x18,%esp
 8048ba8:	c7 45 fc ef be ad de 	movl   $0xdeadbeef,-0x4(%ebp)
 8048baf:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
 8048bb6:	e8 94 01 00 00       	call   8048d4f <entry_check>
 8048bbb:	e8 c4 ff ff ff       	call   8048b84 <getbufn>
 8048bc0:	89 c2                	mov    %eax,%edx
 8048bc2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048bc5:	3d ef be ad de       	cmp    $0xdeadbeef,%eax
 8048bca:	74 0e                	je     8048bda <testn+0x38>
 8048bcc:	c7 04 24 68 98 04 08 	movl   $0x8049868,(%esp)
 8048bd3:	e8 20 fd ff ff       	call   80488f8 <puts@plt>
 8048bd8:	eb 36                	jmp    8048c10 <testn+0x6e>
 8048bda:	3b 15 d0 a1 04 08    	cmp    0x804a1d0,%edx
 8048be0:	75 1e                	jne    8048c00 <testn+0x5e>
 8048be2:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048be6:	c7 04 24 94 98 04 08 	movl   $0x8049894,(%esp)
 8048bed:	e8 96 fc ff ff       	call   8048888 <printf@plt>
 8048bf2:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
 8048bf9:	e8 5e 01 00 00       	call   8048d5c <validate>
 8048bfe:	eb 10                	jmp    8048c10 <testn+0x6e>
 8048c00:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048c04:	c7 04 24 bb 96 04 08 	movl   $0x80496bb,(%esp)
 8048c0b:	e8 78 fc ff ff       	call   8048888 <printf@plt>
 8048c10:	c9                   	leave  
 8048c11:	c3                   	ret    

08048c12 <save_char>:
 8048c12:	55                   	push   %ebp
 8048c13:	89 e5                	mov    %esp,%ebp
 8048c15:	53                   	push   %ebx
 8048c16:	0f b6 5d 08          	movzbl 0x8(%ebp),%ebx
 8048c1a:	81 3d e4 a1 04 08 ff 	cmpl   $0x3ff,0x804a1e4
 8048c21:	03 00 00 
 8048c24:	7f 3e                	jg     8048c64 <save_char+0x52>
 8048c26:	8b 0d e4 a1 04 08    	mov    0x804a1e4,%ecx
 8048c2c:	8d 14 49             	lea    (%ecx,%ecx,2),%edx
 8048c2f:	89 d8                	mov    %ebx,%eax
 8048c31:	c0 f8 04             	sar    $0x4,%al
 8048c34:	83 e0 0f             	and    $0xf,%eax
 8048c37:	0f b6 80 74 a1 04 08 	movzbl 0x804a174(%eax),%eax
 8048c3e:	88 82 00 a2 04 08    	mov    %al,0x804a200(%edx)
 8048c44:	81 c2 00 a2 04 08    	add    $0x804a200,%edx
 8048c4a:	89 d8                	mov    %ebx,%eax
 8048c4c:	83 e0 0f             	and    $0xf,%eax
 8048c4f:	0f b6 80 74 a1 04 08 	movzbl 0x804a174(%eax),%eax
 8048c56:	88 42 01             	mov    %al,0x1(%edx)
 8048c59:	c6 42 02 20          	movb   $0x20,0x2(%edx)
 8048c5d:	41                   	inc    %ecx
 8048c5e:	89 0d e4 a1 04 08    	mov    %ecx,0x804a1e4
 8048c64:	5b                   	pop    %ebx
 8048c65:	c9                   	leave  
 8048c66:	c3                   	ret    

08048c67 <save_term>:
 8048c67:	55                   	push   %ebp
 8048c68:	89 e5                	mov    %esp,%ebp
 8048c6a:	a1 e4 a1 04 08       	mov    0x804a1e4,%eax
 8048c6f:	8d 04 40             	lea    (%eax,%eax,2),%eax
 8048c72:	c6 80 00 a2 04 08 00 	movb   $0x0,0x804a200(%eax)
 8048c79:	c9                   	leave  
 8048c7a:	c3                   	ret    

08048c7b <Gets>:
 8048c7b:	55                   	push   %ebp
 8048c7c:	89 e5                	mov    %esp,%ebp
 8048c7e:	57                   	push   %edi
 8048c7f:	56                   	push   %esi
 8048c80:	53                   	push   %ebx
 8048c81:	83 ec 0c             	sub    $0xc,%esp
 8048c84:	bf 01 00 00 00       	mov    $0x1,%edi
 8048c89:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8048c90:	8b 75 08             	mov    0x8(%ebp),%esi
 8048c93:	c7 05 e4 a1 04 08 00 	movl   $0x0,0x804a1e4
 8048c9a:	00 00 00 
 8048c9d:	83 3d cc a1 04 08 00 	cmpl   $0x0,0x804a1cc
 8048ca4:	75 7d                	jne    8048d23 <Gets+0xa8>
 8048ca6:	eb 0e                	jmp    8048cb6 <Gets+0x3b>
 8048ca8:	88 06                	mov    %al,(%esi)
 8048caa:	46                   	inc    %esi
 8048cab:	0f be c0             	movsbl %al,%eax
 8048cae:	89 04 24             	mov    %eax,(%esp)
 8048cb1:	e8 5c ff ff ff       	call   8048c12 <save_char>
 8048cb6:	a1 c0 a1 04 08       	mov    0x804a1c0,%eax
 8048cbb:	89 04 24             	mov    %eax,(%esp)
 8048cbe:	e8 55 fb ff ff       	call   8048818 <_IO_getc@plt>
 8048cc3:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048cc6:	74 74                	je     8048d3c <Gets+0xc1>
 8048cc8:	83 f8 0a             	cmp    $0xa,%eax
 8048ccb:	75 db                	jne    8048ca8 <Gets+0x2d>
 8048ccd:	8d 76 00             	lea    0x0(%esi),%esi
 8048cd0:	eb 6a                	jmp    8048d3c <Gets+0xc1>
 8048cd2:	e8 51 fb ff ff       	call   8048828 <__ctype_b_loc@plt>
 8048cd7:	8b 00                	mov    (%eax),%eax
 8048cd9:	f6 44 58 01 10       	testb  $0x10,0x1(%eax,%ebx,2)
 8048cde:	66 90                	xchg   %ax,%ax
 8048ce0:	74 41                	je     8048d23 <Gets+0xa8>
 8048ce2:	8d 43 d0             	lea    -0x30(%ebx),%eax
 8048ce5:	89 c2                	mov    %eax,%edx
 8048ce7:	83 f8 09             	cmp    $0x9,%eax
 8048cea:	76 0e                	jbe    8048cfa <Gets+0x7f>
 8048cec:	8d 43 bf             	lea    -0x41(%ebx),%eax
 8048cef:	8d 53 c9             	lea    -0x37(%ebx),%edx
 8048cf2:	83 f8 05             	cmp    $0x5,%eax
 8048cf5:	76 03                	jbe    8048cfa <Gets+0x7f>
 8048cf7:	8d 53 a9             	lea    -0x57(%ebx),%edx
 8048cfa:	85 ff                	test   %edi,%edi
 8048cfc:	74 0a                	je     8048d08 <Gets+0x8d>
 8048cfe:	89 55 f0             	mov    %edx,-0x10(%ebp)
 8048d01:	bf 00 00 00 00       	mov    $0x0,%edi
 8048d06:	eb 1b                	jmp    8048d23 <Gets+0xa8>
 8048d08:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048d0b:	c1 e0 04             	shl    $0x4,%eax
 8048d0e:	01 d0                	add    %edx,%eax
 8048d10:	88 06                	mov    %al,(%esi)
 8048d12:	46                   	inc    %esi
 8048d13:	0f be c0             	movsbl %al,%eax
 8048d16:	89 04 24             	mov    %eax,(%esp)
 8048d19:	e8 f4 fe ff ff       	call   8048c12 <save_char>
 8048d1e:	bf 01 00 00 00       	mov    $0x1,%edi
 8048d23:	a1 c0 a1 04 08       	mov    0x804a1c0,%eax
 8048d28:	89 04 24             	mov    %eax,(%esp)
 8048d2b:	e8 e8 fa ff ff       	call   8048818 <_IO_getc@plt>
 8048d30:	89 c3                	mov    %eax,%ebx
 8048d32:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048d35:	74 05                	je     8048d3c <Gets+0xc1>
 8048d37:	83 f8 0a             	cmp    $0xa,%eax
 8048d3a:	75 96                	jne    8048cd2 <Gets+0x57>
 8048d3c:	c6 06 00             	movb   $0x0,(%esi)
 8048d3f:	e8 23 ff ff ff       	call   8048c67 <save_term>
 8048d44:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d47:	83 c4 0c             	add    $0xc,%esp
 8048d4a:	5b                   	pop    %ebx
 8048d4b:	5e                   	pop    %esi
 8048d4c:	5f                   	pop    %edi
 8048d4d:	c9                   	leave  
 8048d4e:	c3                   	ret    

08048d4f <entry_check>:
 8048d4f:	55                   	push   %ebp
 8048d50:	89 e5                	mov    %esp,%ebp
 8048d52:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d55:	a3 98 a1 04 08       	mov    %eax,0x804a198
 8048d5a:	c9                   	leave  
 8048d5b:	c3                   	ret    

08048d5c <validate>:
 8048d5c:	55                   	push   %ebp
 8048d5d:	89 e5                	mov    %esp,%ebp
 8048d5f:	81 ec 48 01 00 00    	sub    $0x148,%esp
 8048d65:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 8048d68:	89 75 f8             	mov    %esi,-0x8(%ebp)
 8048d6b:	89 7d fc             	mov    %edi,-0x4(%ebp)
 8048d6e:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8048d71:	83 3d d4 a1 04 08 00 	cmpl   $0x0,0x804a1d4
 8048d78:	75 11                	jne    8048d8b <validate+0x2f>
 8048d7a:	c7 04 24 b4 98 04 08 	movl   $0x80498b4,(%esp)
 8048d81:	e8 72 fb ff ff       	call   80488f8 <puts@plt>
 8048d86:	e9 0b 02 00 00       	jmp    8048f96 <validate+0x23a>
 8048d8b:	83 fb 04             	cmp    $0x4,%ebx
 8048d8e:	76 11                	jbe    8048da1 <validate+0x45>
 8048d90:	c7 04 24 e0 98 04 08 	movl   $0x80498e0,(%esp)
 8048d97:	e8 5c fb ff ff       	call   80488f8 <puts@plt>
 8048d9c:	e9 f5 01 00 00       	jmp    8048f96 <validate+0x23a>
 8048da1:	3b 1d 98 a1 04 08    	cmp    0x804a198,%ebx
 8048da7:	74 11                	je     8048dba <validate+0x5e>
 8048da9:	c7 04 24 08 99 04 08 	movl   $0x8049908,(%esp)
 8048db0:	e8 43 fb ff ff       	call   80488f8 <puts@plt>
 8048db5:	e9 dc 01 00 00       	jmp    8048f96 <validate+0x23a>
 8048dba:	c7 05 dc a1 04 08 01 	movl   $0x1,0x804a1dc
 8048dc1:	00 00 00 
 8048dc4:	b8 84 a1 04 08       	mov    $0x804a184,%eax
 8048dc9:	ff 0c 98             	decl   (%eax,%ebx,4)
 8048dcc:	83 3c 98 00          	cmpl   $0x0,(%eax,%ebx,4)
 8048dd0:	7e 11                	jle    8048de3 <validate+0x87>
 8048dd2:	c7 04 24 d7 96 04 08 	movl   $0x80496d7,(%esp)
 8048dd9:	e8 1a fb ff ff       	call   80488f8 <puts@plt>
 8048dde:	e9 b3 01 00 00       	jmp    8048f96 <validate+0x23a>
 8048de3:	83 3d d8 a1 04 08 00 	cmpl   $0x0,0x804a1d8
 8048dea:	74 11                	je     8048dfd <validate+0xa1>
 8048dec:	c7 04 24 e2 96 04 08 	movl   $0x80496e2,(%esp)
 8048df3:	e8 00 fb ff ff       	call   80488f8 <puts@plt>
 8048df8:	e9 99 01 00 00       	jmp    8048f96 <validate+0x23a>
 8048dfd:	83 3d 70 a1 04 08 00 	cmpl   $0x0,0x804a170
 8048e04:	0f 84 80 01 00 00    	je     8048f8a <validate+0x22e>
 8048e0a:	c7 44 24 04 e8 96 04 	movl   $0x80496e8,0x4(%esp)
 8048e11:	08 
 8048e12:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048e19:	e8 0a fb ff ff       	call   8048928 <tempnam@plt>
 8048e1e:	89 c7                	mov    %eax,%edi
 8048e20:	c7 44 24 04 ef 96 04 	movl   $0x80496ef,0x4(%esp)
 8048e27:	08 
 8048e28:	89 04 24             	mov    %eax,(%esp)
 8048e2b:	e8 28 fa ff ff       	call   8048858 <fopen@plt>
 8048e30:	89 c6                	mov    %eax,%esi
 8048e32:	85 c0                	test   %eax,%eax
 8048e34:	75 18                	jne    8048e4e <validate+0xf2>
 8048e36:	c7 04 24 44 99 04 08 	movl   $0x8049944,(%esp)
 8048e3d:	e8 46 fa ff ff       	call   8048888 <printf@plt>
 8048e42:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048e49:	e8 fa fa ff ff       	call   8048948 <exit@plt>
 8048e4e:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048e52:	c7 44 24 08 1b 00 00 	movl   $0x1b,0x8(%esp)
 8048e59:	00 
 8048e5a:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8048e61:	00 
 8048e62:	c7 04 24 f1 96 04 08 	movl   $0x80496f1,(%esp)
 8048e69:	e8 3a fa ff ff       	call   80488a8 <fwrite@plt>
 8048e6e:	89 74 24 04          	mov    %esi,0x4(%esp)
 8048e72:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
 8048e79:	e8 6a fa ff ff       	call   80488e8 <fputc@plt>
 8048e7e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048e85:	e8 4e fa ff ff       	call   80488d8 <cuserid@plt>
 8048e8a:	85 c0                	test   %eax,%eax
 8048e8c:	75 1c                	jne    8048eaa <validate+0x14e>
 8048e8e:	c7 85 d8 fe ff ff 6e 	movl   $0x6f626f6e,-0x128(%ebp)
 8048e95:	6f 62 6f 
 8048e98:	66 c7 85 dc fe ff ff 	movw   $0x7964,-0x124(%ebp)
 8048e9f:	64 79 
 8048ea1:	c6 85 de fe ff ff 00 	movb   $0x0,-0x122(%ebp)
 8048ea8:	eb 12                	jmp    8048ebc <validate+0x160>
 8048eaa:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048eae:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
 8048eb4:	89 04 24             	mov    %eax,(%esp)
 8048eb7:	e8 bc f9 ff ff       	call   8048878 <strcpy@plt>
 8048ebc:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
 8048ec2:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048ec6:	c7 44 24 04 0d 97 04 	movl   $0x804970d,0x4(%esp)
 8048ecd:	08 
 8048ece:	89 34 24             	mov    %esi,(%esp)
 8048ed1:	e8 e2 f9 ff ff       	call   80488b8 <fprintf@plt>
 8048ed6:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
 8048edd:	00 
 8048ede:	c7 44 24 18 00 a2 04 	movl   $0x804a200,0x18(%esp)
 8048ee5:	08 
 8048ee6:	a1 d0 a1 04 08       	mov    0x804a1d0,%eax
 8048eeb:	89 44 24 14          	mov    %eax,0x14(%esp)
 8048eef:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 8048ef3:	a1 d4 a1 04 08       	mov    0x804a1d4,%eax
 8048ef8:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048efc:	c7 44 24 08 6a 90 8c 	movl   $0x8c906a,0x8(%esp)
 8048f03:	00 
 8048f04:	c7 44 24 04 78 99 04 	movl   $0x8049978,0x4(%esp)
 8048f0b:	08 
 8048f0c:	89 34 24             	mov    %esi,(%esp)
 8048f0f:	e8 a4 f9 ff ff       	call   80488b8 <fprintf@plt>
 8048f14:	89 34 24             	mov    %esi,(%esp)
 8048f17:	e8 1c f9 ff ff       	call   8048838 <fclose@plt>
 8048f1c:	c7 44 24 14 1b 97 04 	movl   $0x804971b,0x14(%esp)
 8048f23:	08 
 8048f24:	c7 44 24 10 31 97 04 	movl   $0x8049731,0x10(%esp)
 8048f2b:	08 
 8048f2c:	c7 44 24 0c 39 97 04 	movl   $0x8049739,0xc(%esp)
 8048f33:	08 
 8048f34:	89 7c 24 08          	mov    %edi,0x8(%esp)
 8048f38:	c7 44 24 04 50 97 04 	movl   $0x8049750,0x4(%esp)
 8048f3f:	08 
 8048f40:	8d 9d e8 fe ff ff    	lea    -0x118(%ebp),%ebx
 8048f46:	89 1c 24             	mov    %ebx,(%esp)
 8048f49:	e8 2a f8 ff ff       	call   8048778 <sprintf@plt>
 8048f4e:	89 1c 24             	mov    %ebx,(%esp)
 8048f51:	e8 92 f8 ff ff       	call   80487e8 <system@plt>
 8048f56:	85 c0                	test   %eax,%eax
 8048f58:	75 1a                	jne    8048f74 <validate+0x218>
 8048f5a:	c7 04 24 63 97 04 08 	movl   $0x8049763,(%esp)
 8048f61:	e8 92 f9 ff ff       	call   80488f8 <puts@plt>
 8048f66:	c7 04 24 98 99 04 08 	movl   $0x8049998,(%esp)
 8048f6d:	e8 86 f9 ff ff       	call   80488f8 <puts@plt>
 8048f72:	eb 0c                	jmp    8048f80 <validate+0x224>
 8048f74:	c7 04 24 c8 99 04 08 	movl   $0x80499c8,(%esp)
 8048f7b:	e8 78 f9 ff ff       	call   80488f8 <puts@plt>
 8048f80:	89 3c 24             	mov    %edi,(%esp)
 8048f83:	e8 40 f9 ff ff       	call   80488c8 <remove@plt>
 8048f88:	eb 0c                	jmp    8048f96 <validate+0x23a>
 8048f8a:	c7 04 24 08 9a 04 08 	movl   $0x8049a08,(%esp)
 8048f91:	e8 62 f9 ff ff       	call   80488f8 <puts@plt>
 8048f96:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 8048f99:	8b 75 f8             	mov    -0x8(%ebp),%esi
 8048f9c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 8048f9f:	c9                   	leave  
 8048fa0:	c3                   	ret    

08048fa1 <usage>:
 8048fa1:	55                   	push   %ebp
 8048fa2:	89 e5                	mov    %esp,%ebp
 8048fa4:	83 ec 08             	sub    $0x8,%esp
 8048fa7:	8b 45 08             	mov    0x8(%ebp),%eax
 8048faa:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048fae:	c7 04 24 54 9a 04 08 	movl   $0x8049a54,(%esp)
 8048fb5:	e8 ce f8 ff ff       	call   8048888 <printf@plt>
 8048fba:	c7 04 24 6d 97 04 08 	movl   $0x804976d,(%esp)
 8048fc1:	e8 32 f9 ff ff       	call   80488f8 <puts@plt>
 8048fc6:	c7 04 24 8b 97 04 08 	movl   $0x804978b,(%esp)
 8048fcd:	e8 26 f9 ff ff       	call   80488f8 <puts@plt>
 8048fd2:	c7 04 24 78 9a 04 08 	movl   $0x8049a78,(%esp)
 8048fd9:	e8 1a f9 ff ff       	call   80488f8 <puts@plt>
 8048fde:	c7 04 24 a0 9a 04 08 	movl   $0x8049aa0,(%esp)
 8048fe5:	e8 0e f9 ff ff       	call   80488f8 <puts@plt>
 8048fea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048ff1:	e8 52 f9 ff ff       	call   8048948 <exit@plt>

08048ff6 <bushandler>:
 8048ff6:	55                   	push   %ebp
 8048ff7:	89 e5                	mov    %esp,%ebp
 8048ff9:	83 ec 08             	sub    $0x8,%esp
 8048ffc:	c7 04 24 c4 9a 04 08 	movl   $0x8049ac4,(%esp)
 8049003:	e8 f0 f8 ff ff       	call   80488f8 <puts@plt>
 8049008:	c7 04 24 a2 97 04 08 	movl   $0x80497a2,(%esp)
 804900f:	e8 e4 f8 ff ff       	call   80488f8 <puts@plt>
 8049014:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 804901b:	e8 28 f9 ff ff       	call   8048948 <exit@plt>

08049020 <seghandler>:
 8049020:	55                   	push   %ebp
 8049021:	89 e5                	mov    %esp,%ebp
 8049023:	83 ec 08             	sub    $0x8,%esp
 8049026:	c7 04 24 e4 9a 04 08 	movl   $0x8049ae4,(%esp)
 804902d:	e8 c6 f8 ff ff       	call   80488f8 <puts@plt>
 8049032:	c7 04 24 a2 97 04 08 	movl   $0x80497a2,(%esp)
 8049039:	e8 ba f8 ff ff       	call   80488f8 <puts@plt>
 804903e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049045:	e8 fe f8 ff ff       	call   8048948 <exit@plt>

0804904a <alarmhandler>:
 804904a:	55                   	push   %ebp
 804904b:	89 e5                	mov    %esp,%ebp
 804904d:	83 ec 08             	sub    $0x8,%esp
 8049050:	a1 9c a1 04 08       	mov    0x804a19c,%eax
 8049055:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049059:	c7 04 24 0c 9b 04 08 	movl   $0x8049b0c,(%esp)
 8049060:	e8 23 f8 ff ff       	call   8048888 <printf@plt>
 8049065:	c7 04 24 a2 97 04 08 	movl   $0x80497a2,(%esp)
 804906c:	e8 87 f8 ff ff       	call   80488f8 <puts@plt>
 8049071:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049078:	e8 cb f8 ff ff       	call   8048948 <exit@plt>

0804907d <illegalhandler>:
 804907d:	55                   	push   %ebp
 804907e:	89 e5                	mov    %esp,%ebp
 8049080:	83 ec 08             	sub    $0x8,%esp
 8049083:	c7 04 24 40 9b 04 08 	movl   $0x8049b40,(%esp)
 804908a:	e8 69 f8 ff ff       	call   80488f8 <puts@plt>
 804908f:	c7 04 24 a2 97 04 08 	movl   $0x80497a2,(%esp)
 8049096:	e8 5d f8 ff ff       	call   80488f8 <puts@plt>
 804909b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 80490a2:	e8 a1 f8 ff ff       	call   8048948 <exit@plt>

080490a7 <launch>:
 80490a7:	55                   	push   %ebp
 80490a8:	89 e5                	mov    %esp,%ebp
 80490aa:	83 ec 58             	sub    $0x58,%esp
 80490ad:	83 3d c8 a1 04 08 00 	cmpl   $0x0,0x804a1c8
 80490b4:	74 1c                	je     80490d2 <launch+0x2b>
 80490b6:	8d 45 b8             	lea    -0x48(%ebp),%eax
 80490b9:	89 44 24 08          	mov    %eax,0x8(%esp)
 80490bd:	c7 44 24 04 b8 97 04 	movl   $0x80497b8,0x4(%esp)
 80490c4:	08 
 80490c5:	a1 a8 a1 04 08       	mov    0x804a1a8,%eax
 80490ca:	89 04 24             	mov    %eax,(%esp)
 80490cd:	e8 e6 f7 ff ff       	call   80488b8 <fprintf@plt>
 80490d2:	8d 45 b8             	lea    -0x48(%ebp),%eax
 80490d5:	25 f8 3f 00 00       	and    $0x3ff8,%eax
 80490da:	03 45 0c             	add    0xc(%ebp),%eax
 80490dd:	8d 50 1e             	lea    0x1e(%eax),%edx
 80490e0:	83 e2 f0             	and    $0xfffffff0,%edx
 80490e3:	29 d4                	sub    %edx,%esp
 80490e5:	8d 54 24 1b          	lea    0x1b(%esp),%edx
 80490e9:	83 e2 f0             	and    $0xfffffff0,%edx
 80490ec:	89 44 24 08          	mov    %eax,0x8(%esp)
 80490f0:	c7 44 24 04 f4 00 00 	movl   $0xf4,0x4(%esp)
 80490f7:	00 
 80490f8:	89 14 24             	mov    %edx,(%esp)
 80490fb:	e8 f8 f6 ff ff       	call   80487f8 <memset@plt>
 8049100:	83 3d c4 a1 04 08 00 	cmpl   $0x0,0x804a1c4
 8049107:	75 23                	jne    804912c <launch+0x85>
 8049109:	83 3d cc a1 04 08 00 	cmpl   $0x0,0x804a1cc
 8049110:	74 0e                	je     8049120 <launch+0x79>
 8049112:	c7 04 24 c8 97 04 08 	movl   $0x80497c8,(%esp)
 8049119:	e8 6a f7 ff ff       	call   8048888 <printf@plt>
 804911e:	eb 0c                	jmp    804912c <launch+0x85>
 8049120:	c7 04 24 d9 97 04 08 	movl   $0x80497d9,(%esp)
 8049127:	e8 5c f7 ff ff       	call   8048888 <printf@plt>
 804912c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8049130:	74 07                	je     8049139 <launch+0x92>
 8049132:	e8 6b fa ff ff       	call   8048ba2 <testn>
 8049137:	eb 0c                	jmp    8049145 <launch+0x9e>
 8049139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8049140:	e8 b7 f9 ff ff       	call   8048afc <test>
 8049145:	83 3d dc a1 04 08 00 	cmpl   $0x0,0x804a1dc
 804914c:	75 16                	jne    8049164 <launch+0xbd>
 804914e:	c7 04 24 a2 97 04 08 	movl   $0x80497a2,(%esp)
 8049155:	e8 9e f7 ff ff       	call   80488f8 <puts@plt>
 804915a:	c7 05 dc a1 04 08 00 	movl   $0x0,0x804a1dc
 8049161:	00 00 00 
 8049164:	c9                   	leave  
 8049165:	c3                   	ret    

08049166 <launcher>:
 8049166:	55                   	push   %ebp
 8049167:	89 e5                	mov    %esp,%ebp
 8049169:	53                   	push   %ebx
 804916a:	83 ec 24             	sub    $0x24,%esp
 804916d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049170:	a3 e8 a1 04 08       	mov    %eax,0x804a1e8
 8049175:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049178:	a3 ec a1 04 08       	mov    %eax,0x804a1ec
 804917d:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
 8049184:	00 
 8049185:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
 804918c:	00 
 804918d:	c7 44 24 0c 22 01 00 	movl   $0x122,0xc(%esp)
 8049194:	00 
 8049195:	c7 44 24 08 07 00 00 	movl   $0x7,0x8(%esp)
 804919c:	00 
 804919d:	c7 44 24 04 00 40 00 	movl   $0x4000,0x4(%esp)
 80491a4:	00 
 80491a5:	c7 04 24 00 60 58 55 	movl   $0x55586000,(%esp)
 80491ac:	e8 e7 f5 ff ff       	call   8048798 <mmap@plt>
 80491b1:	89 c3                	mov    %eax,%ebx
 80491b3:	83 f8 ff             	cmp    $0xffffffff,%eax
 80491b6:	75 31                	jne    80491e9 <launcher+0x83>
 80491b8:	a1 a0 a1 04 08       	mov    0x804a1a0,%eax
 80491bd:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80491c1:	c7 44 24 08 23 00 00 	movl   $0x23,0x8(%esp)
 80491c8:	00 
 80491c9:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 80491d0:	00 
 80491d1:	c7 04 24 6c 9b 04 08 	movl   $0x8049b6c,(%esp)
 80491d8:	e8 cb f6 ff ff       	call   80488a8 <fwrite@plt>
 80491dd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80491e4:	e8 5f f7 ff ff       	call   8048948 <exit@plt>
 80491e9:	8d 80 f8 3f 00 00    	lea    0x3ff8(%eax),%eax
 80491ef:	a3 04 ae 04 08       	mov    %eax,0x804ae04
 80491f4:	89 e2                	mov    %esp,%edx
 80491f6:	89 c4                	mov    %eax,%esp
 80491f8:	89 15 f0 a1 04 08    	mov    %edx,0x804a1f0
 80491fe:	a3 08 ae 04 08       	mov    %eax,0x804ae08
 8049203:	a1 ec a1 04 08       	mov    0x804a1ec,%eax
 8049208:	89 44 24 04          	mov    %eax,0x4(%esp)
 804920c:	a1 e8 a1 04 08       	mov    0x804a1e8,%eax
 8049211:	89 04 24             	mov    %eax,(%esp)
 8049214:	e8 8e fe ff ff       	call   80490a7 <launch>
 8049219:	a1 f0 a1 04 08       	mov    0x804a1f0,%eax
 804921e:	89 c4                	mov    %eax,%esp
 8049220:	c7 44 24 04 00 40 00 	movl   $0x4000,0x4(%esp)
 8049227:	00 
 8049228:	89 1c 24             	mov    %ebx,(%esp)
 804922b:	e8 e8 f6 ff ff       	call   8048918 <munmap@plt>
 8049230:	83 c4 24             	add    $0x24,%esp
 8049233:	5b                   	pop    %ebx
 8049234:	c9                   	leave  
 8049235:	c3                   	ret    

08049236 <main>:
 8049236:	55                   	push   %ebp
 8049237:	89 e5                	mov    %esp,%ebp
 8049239:	57                   	push   %edi
 804923a:	56                   	push   %esi
 804923b:	53                   	push   %ebx
 804923c:	83 ec 1c             	sub    $0x1c,%esp
 804923f:	8b 75 08             	mov    0x8(%ebp),%esi
 8049242:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8049245:	83 e4 f0             	and    $0xfffffff0,%esp
 8049248:	83 ec 10             	sub    $0x10,%esp
 804924b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 8049252:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
 8049259:	c7 44 24 04 20 90 04 	movl   $0x8049020,0x4(%esp)
 8049260:	08 
 8049261:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
 8049268:	e8 4b f5 ff ff       	call   80487b8 <signal@plt>
 804926d:	c7 44 24 04 f6 8f 04 	movl   $0x8048ff6,0x4(%esp)
 8049274:	08 
 8049275:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
 804927c:	e8 37 f5 ff ff       	call   80487b8 <signal@plt>
 8049281:	c7 44 24 04 4a 90 04 	movl   $0x804904a,0x4(%esp)
 8049288:	08 
 8049289:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
 8049290:	e8 23 f5 ff ff       	call   80487b8 <signal@plt>
 8049295:	c7 44 24 04 7d 90 04 	movl   $0x804907d,0x4(%esp)
 804929c:	08 
 804929d:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
 80492a4:	e8 0f f5 ff ff       	call   80487b8 <signal@plt>
 80492a9:	a1 a4 a1 04 08       	mov    0x804a1a4,%eax
 80492ae:	a3 c0 a1 04 08       	mov    %eax,0x804a1c0
 80492b3:	e9 23 01 00 00       	jmp    80493db <main+0x1a5>
 80492b8:	0f be c0             	movsbl %al,%eax
 80492bb:	83 e8 66             	sub    $0x66,%eax
 80492be:	83 f8 12             	cmp    $0x12,%eax
 80492c1:	0f 87 0a 01 00 00    	ja     80493d1 <main+0x19b>
 80492c7:	ff 24 85 b8 9b 04 08 	jmp    *0x8049bb8(,%eax,4)
 80492ce:	c7 05 d8 a1 04 08 01 	movl   $0x1,0x804a1d8
 80492d5:	00 00 00 
 80492d8:	c7 05 c4 a1 04 08 01 	movl   $0x1,0x804a1c4
 80492df:	00 00 00 
 80492e2:	c7 05 9c a1 04 08 01 	movl   $0x1,0x804a19c
 80492e9:	00 00 00 
 80492ec:	e9 ea 00 00 00       	jmp    80493db <main+0x1a5>
 80492f1:	8b 03                	mov    (%ebx),%eax
 80492f3:	89 04 24             	mov    %eax,(%esp)
 80492f6:	e8 a6 fc ff ff       	call   8048fa1 <usage>
 80492fb:	e9 db 00 00 00       	jmp    80493db <main+0x1a5>
 8049300:	c7 05 c4 a1 04 08 01 	movl   $0x1,0x804a1c4
 8049307:	00 00 00 
 804930a:	e9 cc 00 00 00       	jmp    80493db <main+0x1a5>
 804930f:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
 8049316:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
 804931d:	e9 b9 00 00 00       	jmp    80493db <main+0x1a5>
 8049322:	c7 05 cc a1 04 08 01 	movl   $0x1,0x804a1cc
 8049329:	00 00 00 
 804932c:	e9 aa 00 00 00       	jmp    80493db <main+0x1a5>
 8049331:	c7 05 c8 a1 04 08 01 	movl   $0x1,0x804a1c8
 8049338:	00 00 00 
 804933b:	e9 9b 00 00 00       	jmp    80493db <main+0x1a5>
 8049340:	a1 ac a1 04 08       	mov    0x804a1ac,%eax
 8049345:	89 04 24             	mov    %eax,(%esp)
 8049348:	e8 eb f5 ff ff       	call   8048938 <__strdup@plt>
 804934d:	a3 d4 a1 04 08       	mov    %eax,0x804a1d4
 8049352:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049356:	c7 04 24 e6 97 04 08 	movl   $0x80497e6,(%esp)
 804935d:	e8 26 f5 ff ff       	call   8048888 <printf@plt>
 8049362:	a1 d4 a1 04 08       	mov    0x804a1d4,%eax
 8049367:	89 04 24             	mov    %eax,(%esp)
 804936a:	e8 b1 01 00 00       	call   8049520 <gencookie>
 804936f:	a3 d0 a1 04 08       	mov    %eax,0x804a1d0
 8049374:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049378:	c7 04 24 f0 97 04 08 	movl   $0x80497f0,(%esp)
 804937f:	e8 04 f5 ff ff       	call   8048888 <printf@plt>
 8049384:	eb 55                	jmp    80493db <main+0x1a5>
 8049386:	c7 44 24 04 fe 97 04 	movl   $0x80497fe,0x4(%esp)
 804938d:	08 
 804938e:	a1 ac a1 04 08       	mov    0x804a1ac,%eax
 8049393:	89 04 24             	mov    %eax,(%esp)
 8049396:	e8 bd f4 ff ff       	call   8048858 <fopen@plt>
 804939b:	a3 c0 a1 04 08       	mov    %eax,0x804a1c0
 80493a0:	85 c0                	test   %eax,%eax
 80493a2:	75 37                	jne    80493db <main+0x1a5>
 80493a4:	a1 ac a1 04 08       	mov    0x804a1ac,%eax
 80493a9:	89 44 24 04          	mov    %eax,0x4(%esp)
 80493ad:	c7 04 24 00 98 04 08 	movl   $0x8049800,(%esp)
 80493b4:	e8 cf f4 ff ff       	call   8048888 <printf@plt>
 80493b9:	8b 03                	mov    (%ebx),%eax
 80493bb:	89 04 24             	mov    %eax,(%esp)
 80493be:	e8 de fb ff ff       	call   8048fa1 <usage>
 80493c3:	eb 16                	jmp    80493db <main+0x1a5>
 80493c5:	c7 05 70 a1 04 08 01 	movl   $0x1,0x804a170
 80493cc:	00 00 00 
 80493cf:	eb 0a                	jmp    80493db <main+0x1a5>
 80493d1:	8b 03                	mov    (%ebx),%eax
 80493d3:	89 04 24             	mov    %eax,(%esp)
 80493d6:	e8 c6 fb ff ff       	call   8048fa1 <usage>
 80493db:	c7 44 24 08 15 98 04 	movl   $0x8049815,0x8(%esp)
 80493e2:	08 
 80493e3:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 80493e7:	89 34 24             	mov    %esi,(%esp)
 80493ea:	e8 59 f4 ff ff       	call   8048848 <getopt@plt>
 80493ef:	3c ff                	cmp    $0xff,%al
 80493f1:	0f 85 c1 fe ff ff    	jne    80492b8 <main+0x82>
 80493f7:	83 3d d4 a1 04 08 00 	cmpl   $0x0,0x804a1d4
 80493fe:	75 16                	jne    8049416 <main+0x1e0>
 8049400:	c7 04 24 90 9b 04 08 	movl   $0x8049b90,(%esp)
 8049407:	e8 ec f4 ff ff       	call   80488f8 <puts@plt>
 804940c:	8b 03                	mov    (%ebx),%eax
 804940e:	89 04 24             	mov    %eax,(%esp)
 8049411:	e8 8b fb ff ff       	call   8048fa1 <usage>
 8049416:	a1 d0 a1 04 08       	mov    0x804a1d0,%eax
 804941b:	89 04 24             	mov    %eax,(%esp)
 804941e:	e8 75 f4 ff ff       	call   8048898 <srandom@plt>
 8049423:	e8 80 f3 ff ff       	call   80487a8 <random@plt>
 8049428:	25 f8 0f 00 00       	and    $0xff8,%eax
 804942d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049430:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
 8049437:	00 
 8049438:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804943b:	89 04 24             	mov    %eax,(%esp)
 804943e:	e8 95 f3 ff ff       	call   80487d8 <calloc@plt>
 8049443:	89 c7                	mov    %eax,%edi
 8049445:	bb 00 00 00 00       	mov    $0x0,%ebx
 804944a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804944d:	83 e8 02             	sub    $0x2,%eax
 8049450:	83 f8 00             	cmp    $0x0,%eax
 8049453:	7e 12                	jle    8049467 <main+0x231>
 8049455:	89 c6                	mov    %eax,%esi
 8049457:	e8 4c f3 ff ff       	call   80487a8 <random@plt>
 804945c:	83 e0 38             	and    $0x38,%eax
 804945f:	89 04 9f             	mov    %eax,(%edi,%ebx,4)
 8049462:	43                   	inc    %ebx
 8049463:	39 de                	cmp    %ebx,%esi
 8049465:	7f f0                	jg     8049457 <main+0x221>
 8049467:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
 804946b:	7e 0b                	jle    8049478 <main+0x242>
 804946d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049470:	c7 44 87 f8 38 00 00 	movl   $0x38,-0x8(%edi,%eax,4)
 8049477:	00 
 8049478:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804947b:	c7 44 87 fc 00 00 00 	movl   $0x0,-0x4(%edi,%eax,4)
 8049482:	00 
 8049483:	a1 9c a1 04 08       	mov    0x804a19c,%eax
 8049488:	89 04 24             	mov    %eax,(%esp)
 804948b:	e8 d8 f3 ff ff       	call   8048868 <alarm@plt>
 8049490:	bb 00 00 00 00       	mov    $0x0,%ebx
 8049495:	3b 5d e8             	cmp    -0x18(%ebp),%ebx
 8049498:	7d 1b                	jge    80494b5 <main+0x27f>
 804949a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804949d:	03 04 9f             	add    (%edi,%ebx,4),%eax
 80494a0:	89 44 24 04          	mov    %eax,0x4(%esp)
 80494a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80494a7:	89 04 24             	mov    %eax,(%esp)
 80494aa:	e8 b7 fc ff ff       	call   8049166 <launcher>
 80494af:	43                   	inc    %ebx
 80494b0:	3b 5d e8             	cmp    -0x18(%ebp),%ebx
 80494b3:	7c e5                	jl     804949a <main+0x264>
 80494b5:	b8 00 00 00 00       	mov    $0x0,%eax
 80494ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
 80494bd:	5b                   	pop    %ebx
 80494be:	5e                   	pop    %esi
 80494bf:	5f                   	pop    %edi
 80494c0:	c9                   	leave  
 80494c1:	c3                   	ret    
 80494c2:	90                   	nop
 80494c3:	90                   	nop

080494c4 <hash>:
 80494c4:	55                   	push   %ebp
 80494c5:	89 e5                	mov    %esp,%ebp
 80494c7:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80494ca:	b8 00 00 00 00       	mov    $0x0,%eax
 80494cf:	80 39 00             	cmpb   $0x0,(%ecx)
 80494d2:	74 0f                	je     80494e3 <hash+0x1f>
 80494d4:	6b d0 67             	imul   $0x67,%eax,%edx
 80494d7:	0f be 01             	movsbl (%ecx),%eax
 80494da:	8d 04 02             	lea    (%edx,%eax,1),%eax
 80494dd:	41                   	inc    %ecx
 80494de:	80 39 00             	cmpb   $0x0,(%ecx)
 80494e1:	75 f1                	jne    80494d4 <hash+0x10>
 80494e3:	c9                   	leave  
 80494e4:	c3                   	ret    

080494e5 <check>:
 80494e5:	55                   	push   %ebp
 80494e6:	89 e5                	mov    %esp,%ebp
 80494e8:	8b 55 08             	mov    0x8(%ebp),%edx
 80494eb:	89 d0                	mov    %edx,%eax
 80494ed:	c1 e8 1c             	shr    $0x1c,%eax
 80494f0:	b9 00 00 00 00       	mov    $0x0,%ecx
 80494f5:	85 c0                	test   %eax,%eax
 80494f7:	74 23                	je     804951c <check+0x37>
 80494f9:	eb 07                	jmp    8049502 <check+0x1d>
 80494fb:	b9 00 00 00 00       	mov    $0x0,%ecx
 8049500:	eb 1a                	jmp    804951c <check+0x37>
 8049502:	b9 00 00 00 00       	mov    $0x0,%ecx
 8049507:	89 d0                	mov    %edx,%eax
 8049509:	d3 e8                	shr    %cl,%eax
 804950b:	3c 0a                	cmp    $0xa,%al
 804950d:	74 ec                	je     80494fb <check+0x16>
 804950f:	83 c1 08             	add    $0x8,%ecx
 8049512:	83 f9 1f             	cmp    $0x1f,%ecx
 8049515:	7e f0                	jle    8049507 <check+0x22>
 8049517:	b9 01 00 00 00       	mov    $0x1,%ecx
 804951c:	89 c8                	mov    %ecx,%eax
 804951e:	c9                   	leave  
 804951f:	c3                   	ret    

08049520 <gencookie>:
 8049520:	55                   	push   %ebp
 8049521:	89 e5                	mov    %esp,%ebp
 8049523:	53                   	push   %ebx
 8049524:	83 ec 04             	sub    $0x4,%esp
 8049527:	8b 45 08             	mov    0x8(%ebp),%eax
 804952a:	89 04 24             	mov    %eax,(%esp)
 804952d:	e8 92 ff ff ff       	call   80494c4 <hash>
 8049532:	89 04 24             	mov    %eax,(%esp)
 8049535:	e8 4e f2 ff ff       	call   8048788 <srand@plt>
 804953a:	e8 c9 f3 ff ff       	call   8048908 <rand@plt>
 804953f:	89 c3                	mov    %eax,%ebx
 8049541:	89 04 24             	mov    %eax,(%esp)
 8049544:	e8 9c ff ff ff       	call   80494e5 <check>
 8049549:	85 c0                	test   %eax,%eax
 804954b:	74 ed                	je     804953a <gencookie+0x1a>
 804954d:	89 d8                	mov    %ebx,%eax
 804954f:	83 c4 04             	add    $0x4,%esp
 8049552:	5b                   	pop    %ebx
 8049553:	c9                   	leave  
 8049554:	c3                   	ret    
 8049555:	90                   	nop
 8049556:	90                   	nop
 8049557:	90                   	nop
 8049558:	90                   	nop
 8049559:	90                   	nop
 804955a:	90                   	nop
 804955b:	90                   	nop
 804955c:	90                   	nop
 804955d:	90                   	nop
 804955e:	90                   	nop
 804955f:	90                   	nop

08049560 <__libc_csu_fini>:
 8049560:	55                   	push   %ebp
 8049561:	89 e5                	mov    %esp,%ebp
 8049563:	5d                   	pop    %ebp
 8049564:	c3                   	ret    
 8049565:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08049570 <__libc_csu_init>:
 8049570:	55                   	push   %ebp
 8049571:	89 e5                	mov    %esp,%ebp
 8049573:	57                   	push   %edi
 8049574:	56                   	push   %esi
 8049575:	53                   	push   %ebx
 8049576:	e8 5e 00 00 00       	call   80495d9 <__i686.get_pc_thunk.bx>
 804957b:	81 c3 65 0b 00 00    	add    $0xb65,%ebx
 8049581:	83 ec 1c             	sub    $0x1c,%esp
 8049584:	e8 c7 f1 ff ff       	call   8048750 <_init>
 8049589:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 804958f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049592:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 8049598:	29 45 f0             	sub    %eax,-0x10(%ebp)
 804959b:	c1 7d f0 02          	sarl   $0x2,-0x10(%ebp)
 804959f:	8b 55 f0             	mov    -0x10(%ebp),%edx
 80495a2:	85 d2                	test   %edx,%edx
 80495a4:	74 2b                	je     80495d1 <__libc_csu_init+0x61>
 80495a6:	31 ff                	xor    %edi,%edi
 80495a8:	89 c6                	mov    %eax,%esi
 80495aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80495b0:	8b 45 10             	mov    0x10(%ebp),%eax
 80495b3:	83 c7 01             	add    $0x1,%edi
 80495b6:	89 44 24 08          	mov    %eax,0x8(%esp)
 80495ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 80495bd:	89 44 24 04          	mov    %eax,0x4(%esp)
 80495c1:	8b 45 08             	mov    0x8(%ebp),%eax
 80495c4:	89 04 24             	mov    %eax,(%esp)
 80495c7:	ff 16                	call   *(%esi)
 80495c9:	83 c6 04             	add    $0x4,%esi
 80495cc:	39 7d f0             	cmp    %edi,-0x10(%ebp)
 80495cf:	75 df                	jne    80495b0 <__libc_csu_init+0x40>
 80495d1:	83 c4 1c             	add    $0x1c,%esp
 80495d4:	5b                   	pop    %ebx
 80495d5:	5e                   	pop    %esi
 80495d6:	5f                   	pop    %edi
 80495d7:	5d                   	pop    %ebp
 80495d8:	c3                   	ret    

080495d9 <__i686.get_pc_thunk.bx>:
 80495d9:	8b 1c 24             	mov    (%esp),%ebx
 80495dc:	c3                   	ret    
 80495dd:	90                   	nop
 80495de:	90                   	nop
 80495df:	90                   	nop

080495e0 <__do_global_ctors_aux>:
 80495e0:	55                   	push   %ebp
 80495e1:	89 e5                	mov    %esp,%ebp
 80495e3:	53                   	push   %ebx
 80495e4:	bb 00 a0 04 08       	mov    $0x804a000,%ebx
 80495e9:	83 ec 04             	sub    $0x4,%esp
 80495ec:	a1 00 a0 04 08       	mov    0x804a000,%eax
 80495f1:	eb 07                	jmp    80495fa <__do_global_ctors_aux+0x1a>
 80495f3:	83 eb 04             	sub    $0x4,%ebx
 80495f6:	ff d0                	call   *%eax
 80495f8:	8b 03                	mov    (%ebx),%eax
 80495fa:	83 f8 ff             	cmp    $0xffffffff,%eax
 80495fd:	75 f4                	jne    80495f3 <__do_global_ctors_aux+0x13>
 80495ff:	83 c4 04             	add    $0x4,%esp
 8049602:	5b                   	pop    %ebx
 8049603:	c9                   	leave  
 8049604:	c3                   	ret    
 8049605:	90                   	nop
 8049606:	90                   	nop
 8049607:	90                   	nop

Disassembly of section .fini:

08049608 <_fini>:
 8049608:	55                   	push   %ebp
 8049609:	89 e5                	mov    %esp,%ebp
 804960b:	53                   	push   %ebx
 804960c:	83 ec 04             	sub    $0x4,%esp
 804960f:	e8 00 00 00 00       	call   8049614 <_fini+0xc>
 8049614:	5b                   	pop    %ebx
 8049615:	81 c3 cc 0a 00 00    	add    $0xacc,%ebx
 804961b:	e8 90 f3 ff ff       	call   80489b0 <__do_global_dtors_aux>
 8049620:	59                   	pop    %ecx
 8049621:	5b                   	pop    %ebx
 8049622:	c9                   	leave  
 8049623:	c3                   	ret    
