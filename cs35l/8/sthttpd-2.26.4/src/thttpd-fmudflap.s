	.file	"thttpd.c"
	.local	argv0
	.comm	argv0,4,4
	.local	debug
	.comm	debug,4,4
	.local	port
	.comm	port,2,2
	.local	dir
	.comm	dir,4,4
	.local	data_dir
	.comm	data_dir,4,4
	.local	do_chroot
	.comm	do_chroot,4,4
	.local	no_log
	.comm	no_log,4,4
	.local	no_symlink_check
	.comm	no_symlink_check,4,4
	.local	do_vhost
	.comm	do_vhost,4,4
	.local	do_global_passwd
	.comm	do_global_passwd,4,4
	.local	cgi_pattern
	.comm	cgi_pattern,4,4
	.local	cgi_limit
	.comm	cgi_limit,4,4
	.local	url_pattern
	.comm	url_pattern,4,4
	.local	no_empty_referers
	.comm	no_empty_referers,4,4
	.local	local_pattern
	.comm	local_pattern,4,4
	.local	logfile
	.comm	logfile,4,4
	.local	throttlefile
	.comm	throttlefile,4,4
	.local	hostname
	.comm	hostname,4,4
	.local	pidfile
	.comm	pidfile,4,4
	.local	user
	.comm	user,4,4
	.local	charset
	.comm	charset,4,4
	.local	p3p
	.comm	p3p,4,4
	.local	max_age
	.comm	max_age,4,4
	.local	throttles
	.comm	throttles,4,4
	.local	numthrottles
	.comm	numthrottles,4,4
	.local	maxthrottles
	.comm	maxthrottles,4,4
	.local	connects
	.comm	connects,4,4
	.local	num_connects
	.comm	num_connects,4,4
	.local	max_connects
	.comm	max_connects,4,4
	.local	first_free_connect
	.comm	first_free_connect,4,4
	.local	httpd_conn_count
	.comm	httpd_conn_count,4,4
	.local	hs
	.comm	hs,4,4
	.globl	terminate
	.bss
	.align 4
	.type	terminate, @object
	.size	terminate, 4
terminate:
	.zero	4
	.comm	start_time,4,4
	.comm	stats_time,4,4
	.comm	stats_connections,4,4
	.comm	stats_bytes,4,4
	.comm	stats_simultaneous,4,4
	.local	got_hup
	.comm	got_hup,4,4
	.local	got_usr1
	.comm	got_usr1,4,4
	.local	watchdog_flag
	.comm	watchdog_flag,4,4
	.section	.rodata
.LC0:
	.string	"exiting due to signal %d"
	.text
	.type	handle_term, @function
handle_term:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	shut_down
	movl	8(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$5, (%esp)
	call	syslog
	call	closelog
	movl	$1, (%esp)
	call	exit
	.cfi_endproc
.LFE0:
	.size	handle_term, .-handle_term
	.section	.rodata
	.align 4
.LC1:
	.string	"thttpd.c:188:9 (handle_chld) status"
.LC2:
	.string	"thttpd.c:186:15 (handle_chld)"
.LC3:
	.string	"thttpd.c:207:11 (handle_chld)"
.LC4:
	.string	"thttpd.c:207:29 (handle_chld)"
.LC5:
	.string	"thttpd.c:212:11 (handle_chld)"
.LC6:
	.string	"child wait - %m"
.LC7:
	.string	"thttpd.c:224:10 (handle_chld)"
.LC8:
	.string	"thttpd.c:224:6 (handle_chld)"
.LC9:
	.string	"thttpd.c:225:13 (handle_chld)"
.LC10:
	.string	"thttpd.c:226:17 (handle_chld)"
.LC11:
	.string	"thttpd.c:231:11 (handle_chld)"
	.text
	.type	handle_chld, @function
handle_chld:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$76, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -56(%ebp)
	movl	$.LC1, 12(%esp)
	movl	$3, 8(%esp)
	movl	$4, 4(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_register
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	leal	3(%ebx), %eax
	movl	%eax, %esi
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-56(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-45(%ebp)
	movl	4(%ecx), %eax
	cmpl	%esi, %eax
	setb	%al
	orb	-45(%ebp), %al
	testb	%al, %al
	je	.L3
	movl	%esi, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC2, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -56(%ebp)
.L3:
	movl	(%ebx), %eax
	movl	%eax, -28(%ebp)
	jmp	.L18
.L23:
	nop
.L18:
	movl	$1, 8(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$-1, (%esp)
	call	__mfwrap_waitpid
	movl	%eax, -32(%ebp)
	cmpl	$0, -32(%ebp)
	je	.L20
.L4:
	cmpl	$0, -32(%ebp)
	jns	.L6
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	leal	3(%ebx), %eax
	movl	%eax, %esi
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-56(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-46(%ebp)
	movl	4(%ecx), %eax
	cmpl	%esi, %eax
	setb	%al
	orb	-46(%ebp), %al
	testb	%al, %al
	je	.L7
	movl	%esi, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC3, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -56(%ebp)
.L7:
	movl	(%ebx), %eax
	cmpl	$4, %eax
	je	.L21
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	leal	3(%ebx), %eax
	movl	%eax, %esi
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-56(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-47(%ebp)
	movl	4(%ecx), %eax
	cmpl	%esi, %eax
	setb	%al
	orb	-47(%ebp), %al
	testb	%al, %al
	je	.L9
	movl	%esi, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC4, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -56(%ebp)
.L9:
	movl	(%ebx), %eax
	cmpl	$11, %eax
	je	.L21
.L10:
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	leal	3(%ebx), %eax
	movl	%eax, %esi
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-56(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-48(%ebp)
	movl	4(%ecx), %eax
	cmpl	%esi, %eax
	setb	%al
	orb	-48(%ebp), %al
	testb	%al, %al
	je	.L12
	movl	%esi, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC5, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -56(%ebp)
.L12:
	movl	(%ebx), %eax
	cmpl	$10, %eax
	je	.L22
	movl	$.LC6, 4(%esp)
	movl	$3, (%esp)
	call	syslog
	jmp	.L22
.L6:
	movl	hs, %eax
	testl	%eax, %eax
	je	.L23
	movl	hs, %ebx
	movl	%ebx, %edx
	leal	20(%ebx), %eax
	leal	3(%eax), %esi
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-56(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-49(%ebp)
	movl	4(%ecx), %eax
	cmpl	%esi, %eax
	setb	%al
	orb	-49(%ebp), %al
	testb	%al, %al
	je	.L14
	movl	%esi, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC7, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -56(%ebp)
.L14:
	movl	20(%ebx), %eax
	subl	$1, %eax
	movl	%eax, -44(%ebp)
	movl	%ebx, %esi
	leal	20(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -60(%ebp)
	movl	%esi, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-56(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%esi, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-60(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L15
	movl	-60(%ebp), %eax
	subl	%esi, %eax
	addl	$1, %eax
	movl	$.LC8, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -56(%ebp)
.L15:
	movl	-44(%ebp), %ecx
	movl	%ecx, 20(%ebx)
	movl	hs, %ebx
	movl	%ebx, %edx
	leal	20(%ebx), %eax
	leal	3(%eax), %esi
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-56(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-50(%ebp)
	movl	4(%ecx), %eax
	cmpl	%esi, %eax
	setb	%al
	orb	-50(%ebp), %al
	testb	%al, %al
	je	.L16
	movl	%esi, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC9, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -56(%ebp)
.L16:
	movl	20(%ebx), %eax
	testl	%eax, %eax
	jns	.L23
	movl	hs, %ebx
	movl	%ebx, %edx
	leal	20(%ebx), %eax
	leal	3(%eax), %esi
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-56(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-51(%ebp)
	movl	4(%ecx), %eax
	cmpl	%esi, %eax
	setb	%al
	orb	-51(%ebp), %al
	testb	%al, %al
	je	.L17
	movl	%esi, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC10, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -56(%ebp)
.L17:
	movl	$0, 20(%ebx)
	jmp	.L23
.L21:
	nop
.L11:
	jmp	.L23
.L20:
	nop
	jmp	.L5
.L22:
	nop
.L5:
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %eax
	leal	3(%ebx), %edx
	movl	%edx, %esi
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-56(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%esi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L19
	movl	%esi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC11, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L19:
	movl	-28(%ebp), %eax
	movl	%eax, (%ebx)
	movl	$3, 8(%esp)
	movl	$4, 4(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_unregister
	addl	$76, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	handle_chld, .-handle_chld
	.section	.rodata
.LC12:
	.string	"thttpd.c:239:15 (handle_hup)"
.LC13:
	.string	"thttpd.c:250:11 (handle_hup)"
	.text
	.type	handle_hup, @function
handle_hup:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -48(%ebp)
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	leal	3(%ebx), %eax
	movl	%eax, %esi
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-48(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-41(%ebp)
	movl	4(%ecx), %eax
	cmpl	%esi, %eax
	setb	%al
	orb	-41(%ebp), %al
	testb	%al, %al
	je	.L25
	movl	%esi, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC12, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -48(%ebp)
.L25:
	movl	(%ebx), %eax
	movl	%eax, -28(%ebp)
	movl	$1, got_hup
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %eax
	leal	3(%ebx), %edx
	movl	%edx, %esi
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-48(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%esi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L26
	movl	%esi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC13, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L26:
	movl	-28(%ebp), %eax
	movl	%eax, (%ebx)
	addl	$60, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	handle_hup, .-handle_hup
	.section	.rodata
.LC14:
	.string	"exiting"
	.text
	.type	handle_usr1, @function
handle_usr1:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	num_connects, %eax
	testl	%eax, %eax
	jne	.L28
	call	shut_down
	movl	$.LC14, 4(%esp)
	movl	$5, (%esp)
	call	syslog
	call	closelog
	movl	$0, (%esp)
	call	exit
.L28:
	movl	$1, got_usr1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	handle_usr1, .-handle_usr1
	.section	.rodata
.LC15:
	.string	"thttpd.c:283:15 (handle_usr2)"
.LC16:
	.string	"thttpd.c:293:11 (handle_usr2)"
	.text
	.type	handle_usr2, @function
handle_usr2:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -48(%ebp)
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	leal	3(%ebx), %eax
	movl	%eax, %esi
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-48(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-41(%ebp)
	movl	4(%ecx), %eax
	cmpl	%esi, %eax
	setb	%al
	orb	-41(%ebp), %al
	testb	%al, %al
	je	.L30
	movl	%esi, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC15, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -48(%ebp)
.L30:
	movl	(%ebx), %eax
	movl	%eax, -28(%ebp)
	movl	$0, (%esp)
	call	logstats
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %eax
	leal	3(%ebx), %edx
	movl	%edx, %esi
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-48(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%esi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L31
	movl	%esi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC16, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L31:
	movl	-28(%ebp), %eax
	movl	%eax, (%ebx)
	addl	$60, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	handle_usr2, .-handle_usr2
	.section	.rodata
.LC17:
	.string	"thttpd.c:301:15 (handle_alrm)"
.LC18:
	.string	"/tmp"
.LC19:
	.string	"thttpd.c:321:11 (handle_alrm)"
	.text
	.type	handle_alrm, @function
handle_alrm:
.LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -48(%ebp)
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	leal	3(%ebx), %eax
	movl	%eax, %esi
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-48(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-41(%ebp)
	movl	4(%ecx), %eax
	cmpl	%esi, %eax
	setb	%al
	orb	-41(%ebp), %al
	testb	%al, %al
	je	.L33
	movl	%esi, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC17, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -48(%ebp)
.L33:
	movl	(%ebx), %eax
	movl	%eax, -28(%ebp)
	movl	watchdog_flag, %eax
	testl	%eax, %eax
	jne	.L34
	movl	$.LC18, (%esp)
	call	chdir
	call	abort
.L34:
	movl	$0, watchdog_flag
	movl	$360, (%esp)
	call	alarm
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %eax
	leal	3(%ebx), %edx
	movl	%edx, %esi
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-48(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%esi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L35
	movl	%esi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC19, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L35:
	movl	-28(%ebp), %eax
	movl	%eax, (%ebx)
	addl	$60, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	handle_alrm, .-handle_alrm
	.section	.rodata
.LC20:
	.string	"-"
.LC21:
	.string	"re-opening logfile"
.LC22:
	.string	"a"
.LC23:
	.string	"re-opening %.80s - %m"
	.text
	.type	re_open_logfile, @function
re_open_logfile:
.LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	no_log, %eax
	testl	%eax, %eax
	jne	.L41
	movl	hs, %eax
	testl	%eax, %eax
	je	.L41
.L38:
	movl	logfile, %eax
	testl	%eax, %eax
	je	.L36
	movl	logfile, %eax
	movl	$.LC20, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	je	.L36
	movl	$.LC21, 4(%esp)
	movl	$5, (%esp)
	call	syslog
	movl	logfile, %eax
	movl	$.LC22, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_fopen
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L40
	movl	logfile, %eax
	movl	%eax, 8(%esp)
	movl	$.LC23, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	jmp	.L36
.L40:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_fileno
	movl	$1, 8(%esp)
	movl	$2, 4(%esp)
	movl	%eax, (%esp)
	call	fcntl
	movl	hs, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	httpd_set_logfp
	jmp	.L36
.L41:
	nop
.L36:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	re_open_logfile, .-re_open_logfile
	.section	.rodata
.LC24:
	.string	"thttpd.c:356:10 (main) cwd"
.LC25:
	.string	"thttpd.c:362:20 (main) sa4"
.LC26:
	.string	"thttpd.c:363:20 (main) sa6"
.LC27:
	.string	"thttpd.c:364:9 (main) gotv4"
.LC28:
	.string	"thttpd.c:364:16 (main) gotv6"
.LC29:
	.string	"thttpd.c:365:20 (main) tv"
.LC30:
	.string	"thttpd.c:367:17 (main)"
.LC31:
	.string	"can't find any valid address"
	.align 4
.LC32:
	.string	"%s: can't find any valid address\n"
.LC33:
	.string	"unknown user - '%.80s'"
.LC34:
	.string	"%s: unknown user - '%s'\n"
.LC35:
	.string	"thttpd.c:410:6 (main)"
.LC36:
	.string	"thttpd.c:411:6 (main)"
.LC37:
	.string	"/dev/null"
.LC38:
	.string	"%.80s - %m"
.LC39:
	.string	"thttpd.c:433:22 (main)"
	.align 4
.LC40:
	.string	"logfile is not an absolute path, you may not be able to re-open it"
	.align 4
.LC41:
	.string	"%s: logfile is not an absolute path, you may not be able to re-open it\n"
.LC42:
	.string	"fchown logfile - %m"
.LC43:
	.string	"fchown logfile"
.LC44:
	.string	"chdir - %m"
.LC45:
	.string	"chdir"
.LC46:
	.string	"thttpd.c:483:13 (main)"
.LC47:
	.string	"/"
.LC48:
	.string	"daemon - %m"
.LC49:
	.string	"w"
.LC50:
	.string	"%d\n"
	.align 4
.LC51:
	.string	"fdwatch initialization failure"
.LC52:
	.string	"chroot - %m"
.LC53:
	.string	"chroot"
	.align 4
.LC54:
	.string	"logfile is not within the chroot tree, you will not be able to re-open it"
	.align 4
.LC55:
	.string	"%s: logfile is not within the chroot tree, you will not be able to re-open it\n"
.LC56:
	.string	"chroot chdir - %m"
.LC57:
	.string	"chroot chdir"
.LC58:
	.string	"data_dir chdir - %m"
.LC59:
	.string	"data_dir chdir"
.LC60:
	.string	"tmr_create(occasional) failed"
.LC61:
	.string	"tmr_create(idle) failed"
	.align 4
.LC62:
	.string	"tmr_create(update_throttles) failed"
.LC63:
	.string	"tmr_create(show_stats) failed"
.LC64:
	.string	"setgroups - %m"
.LC65:
	.string	"setgid - %m"
.LC66:
	.string	"initgroups - %m"
.LC67:
	.string	"setuid - %m"
	.align 4
.LC68:
	.string	"started as root without requesting chroot(), warning only"
	.align 4
.LC69:
	.string	"out of memory allocating a connecttab"
.LC70:
	.string	"thttpd.c:722:28 (main)"
.LC71:
	.string	"thttpd.c:723:35 (main)"
.LC72:
	.string	"thttpd.c:724:20 (main)"
.LC73:
	.string	"thttpd.c:726:50 (main)"
.LC74:
	.string	"thttpd.c:733:9 (main)"
.LC75:
	.string	"thttpd.c:734:20 (main)"
.LC76:
	.string	"thttpd.c:735:9 (main)"
.LC77:
	.string	"thttpd.c:736:20 (main)"
.LC78:
	.string	"thttpd.c:754:11 (main)"
.LC79:
	.string	"thttpd.c:754:29 (main)"
.LC80:
	.string	"fdwatch - %m"
.LC81:
	.string	"thttpd.c:769:36 (main)"
.LC82:
	.string	"thttpd.c:770:23 (main)"
.LC83:
	.string	"thttpd.c:772:28 (main)"
.LC84:
	.string	"thttpd.c:779:36 (main)"
.LC85:
	.string	"thttpd.c:780:23 (main)"
.LC86:
	.string	"thttpd.c:782:28 (main)"
.LC87:
	.string	"thttpd.c:795:9 (main)"
.LC88:
	.string	"thttpd.c:796:29 (main)"
.LC89:
	.string	"thttpd.c:800:13 (main)"
.LC90:
	.string	"thttpd.c:814:10 (main)"
.LC91:
	.string	"thttpd.c:815:21 (main)"
.LC92:
	.string	"thttpd.c:816:10 (main)"
.LC93:
	.string	"thttpd.c:817:21 (main)"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	andl	$-16, %esp
	subl	$4672, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
	movl	$.LC24, 12(%esp)
	movl	$3, 8(%esp)
	movl	$4097, 4(%esp)
	leal	535(%esp), %eax
	movl	%eax, (%esp)
	call	__mf_register
	movl	$.LC25, 12(%esp)
	movl	$3, 8(%esp)
	movl	$128, 4(%esp)
	leal	404(%esp), %eax
	movl	%eax, (%esp)
	call	__mf_register
	movl	$.LC26, 12(%esp)
	movl	$3, 8(%esp)
	movl	$128, 4(%esp)
	leal	276(%esp), %eax
	movl	%eax, (%esp)
	call	__mf_register
	movl	$.LC27, 12(%esp)
	movl	$3, 8(%esp)
	movl	$4, 4(%esp)
	leal	272(%esp), %eax
	movl	%eax, (%esp)
	call	__mf_register
	movl	$.LC28, 12(%esp)
	movl	$3, 8(%esp)
	movl	$4, 4(%esp)
	leal	268(%esp), %eax
	movl	%eax, (%esp)
	call	__mf_register
	movl	$.LC29, 12(%esp)
	movl	$3, 8(%esp)
	movl	$8, 4(%esp)
	leal	260(%esp), %eax
	movl	%eax, (%esp)
	call	__mf_register
	movl	$32767, 4664(%esp)
	movl	$32767, 4660(%esp)
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	addl	$3, %edx
	movl	%edx, %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L43
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC30, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L43:
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, argv0
	movl	argv0, %eax
	movl	$47, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strrchr
	movl	%eax, 4668(%esp)
	cmpl	$0, 4668(%esp)
	je	.L44
	addl	$1, 4668(%esp)
	jmp	.L45
.L44:
	movl	argv0, %eax
	movl	%eax, 4668(%esp)
.L45:
	movl	$24, 8(%esp)
	movl	$9, 4(%esp)
	movl	4668(%esp), %eax
	movl	%eax, (%esp)
	call	openlog
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	parse_args
	call	tzset
	leal	268(%esp), %eax
	movl	%eax, 20(%esp)
	movl	$128, 16(%esp)
	leal	276(%esp), %eax
	movl	%eax, 12(%esp)
	leal	272(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$128, 4(%esp)
	leal	404(%esp), %eax
	movl	%eax, (%esp)
	call	lookup_hostname
	movl	272(%esp), %eax
	testl	%eax, %eax
	jne	.L46
	movl	268(%esp), %eax
	testl	%eax, %eax
	jne	.L46
	movl	$.LC31, 4(%esp)
	movl	$3, (%esp)
	call	syslog
	movl	argv0, %edx
	movl	stderr, %eax
	movl	%edx, 8(%esp)
	movl	$.LC32, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_fprintf
	movl	$1, (%esp)
	call	exit
.L46:
	movl	$0, numthrottles
	movl	$0, maxthrottles
	movl	$0, throttles
	movl	throttlefile, %eax
	testl	%eax, %eax
	je	.L47
	movl	throttlefile, %eax
	movl	%eax, (%esp)
	call	read_throttlefile
.L47:
	call	getuid
	testl	%eax, %eax
	jne	.L48
	movl	user, %eax
	movl	%eax, (%esp)
	call	__mfwrap_getpwnam
	movl	%eax, 4648(%esp)
	cmpl	$0, 4648(%esp)
	jne	.L49
	movl	user, %eax
	movl	%eax, 8(%esp)
	movl	$.LC33, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	user, %ecx
	movl	argv0, %edx
	movl	stderr, %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_fprintf
	movl	$1, (%esp)
	call	exit
.L49:
	movl	4648(%esp), %eax
	movl	4648(%esp), %edx
	addl	$8, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L50
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC35, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L50:
	movl	4648(%esp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4664(%esp)
	movl	4648(%esp), %eax
	movl	4648(%esp), %edx
	addl	$12, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L51
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC36, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L51:
	movl	4648(%esp), %eax
	movl	12(%eax), %eax
	movl	%eax, 4660(%esp)
.L48:
	movl	logfile, %eax
	testl	%eax, %eax
	je	.L52
	movl	logfile, %eax
	movl	$.LC37, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L53
	movl	$1, no_log
	movl	$0, 4656(%esp)
	jmp	.L54
.L53:
	movl	logfile, %eax
	movl	$.LC20, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L55
	movl	stdout, %eax
	movl	%eax, 4656(%esp)
	jmp	.L54
.L55:
	movl	logfile, %eax
	movl	$.LC22, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_fopen
	movl	%eax, 4656(%esp)
	cmpl	$0, 4656(%esp)
	jne	.L56
	movl	logfile, %eax
	movl	%eax, 8(%esp)
	movl	$.LC38, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	logfile, %eax
	movl	%eax, (%esp)
	call	perror
	movl	$1, (%esp)
	call	exit
.L56:
	movl	logfile, %ebx
	movl	%ebx, %edx
	movl	%ebx, 168(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	195(%esp)
	movl	4(%ecx), %eax
	cmpl	168(%esp), %eax
	setb	%al
	orb	195(%esp), %al
	testb	%al, %al
	je	.L57
	movl	168(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC39, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L57:
	movzbl	(%ebx), %eax
	cmpb	$47, %al
	je	.L58
	movl	$.LC40, 4(%esp)
	movl	$4, (%esp)
	call	syslog
	movl	argv0, %edx
	movl	stderr, %eax
	movl	%edx, 8(%esp)
	movl	$.LC41, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_fprintf
.L58:
	movl	4656(%esp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_fileno
	movl	$1, 8(%esp)
	movl	$2, 4(%esp)
	movl	%eax, (%esp)
	call	fcntl
	call	getuid
	testl	%eax, %eax
	jne	.L54
	movl	4656(%esp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_fileno
	movl	4660(%esp), %edx
	movl	%edx, 8(%esp)
	movl	4664(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fchown
	testl	%eax, %eax
	jns	.L54
	movl	$.LC42, 4(%esp)
	movl	$4, (%esp)
	call	syslog
	movl	$.LC43, (%esp)
	call	perror
	jmp	.L54
.L52:
	movl	$0, 4656(%esp)
.L54:
	movl	dir, %eax
	testl	%eax, %eax
	je	.L59
	movl	dir, %eax
	movl	%eax, (%esp)
	call	chdir
	testl	%eax, %eax
	jns	.L59
	movl	$.LC44, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$.LC45, (%esp)
	call	perror
	movl	$1, (%esp)
	call	exit
.L59:
	movl	$4096, 4(%esp)
	leal	535(%esp), %eax
	movl	%eax, (%esp)
	call	getcwd
	leal	535(%esp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strlen
	leal	-1(%eax), %ebx
	leal	535(%esp), %edx
	leal	535(%esp), %eax
	addl	%ebx, %eax
	movl	%eax, 164(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	194(%esp)
	movl	4(%ecx), %eax
	cmpl	164(%esp), %eax
	setb	%al
	orb	194(%esp), %al
	testb	%al, %al
	je	.L60
	movl	164(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC46, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L60:
	movzbl	535(%esp,%ebx), %eax
	cmpb	$47, %al
	je	.L61
	movl	$.LC47, 4(%esp)
	leal	535(%esp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcat
.L61:
	movl	debug, %eax
	testl	%eax, %eax
	jne	.L62
	movl	stdin, %eax
	movl	%eax, (%esp)
	call	__mfwrap_fclose
	movl	stdout, %eax
	cmpl	%eax, 4656(%esp)
	je	.L63
	movl	stdout, %eax
	movl	%eax, (%esp)
	call	__mfwrap_fclose
.L63:
	movl	stderr, %eax
	movl	%eax, (%esp)
	call	__mfwrap_fclose
	movl	$1, 4(%esp)
	movl	$1, (%esp)
	call	daemon
	testl	%eax, %eax
	jns	.L64
	movl	$.LC48, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L62:
	call	setsid
.L64:
	movl	pidfile, %eax
	testl	%eax, %eax
	je	.L65
	movl	pidfile, %eax
	movl	$.LC49, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_fopen
	movl	%eax, 4644(%esp)
	cmpl	$0, 4644(%esp)
	jne	.L66
	movl	pidfile, %eax
	movl	%eax, 8(%esp)
	movl	$.LC38, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L66:
	call	getpid
	movl	%eax, 8(%esp)
	movl	$.LC50, 4(%esp)
	movl	4644(%esp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_fprintf
	movl	4644(%esp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_fclose
.L65:
	call	fdwatch_get_nfiles
	movl	%eax, max_connects
	movl	max_connects, %eax
	testl	%eax, %eax
	jns	.L67
	movl	$.LC51, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L67:
	movl	max_connects, %eax
	subl	$10, %eax
	movl	%eax, max_connects
	movl	do_chroot, %eax
	testl	%eax, %eax
	je	.L68
	leal	535(%esp), %eax
	movl	%eax, (%esp)
	call	chroot
	testl	%eax, %eax
	jns	.L69
	movl	$.LC52, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$.LC53, (%esp)
	call	perror
	movl	$1, (%esp)
	call	exit
.L69:
	movl	logfile, %eax
	testl	%eax, %eax
	je	.L70
	movl	logfile, %eax
	movl	$.LC20, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	je	.L70
	leal	535(%esp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strlen
	movl	logfile, %edx
	movl	%eax, 8(%esp)
	leal	535(%esp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mfwrap_strncmp
	testl	%eax, %eax
	jne	.L71
	movl	logfile, %ebx
	leal	535(%esp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strlen
	subl	$1, %eax
	leal	(%ebx,%eax), %edx
	movl	logfile, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcpy
	jmp	.L70
.L71:
	movl	$.LC54, 4(%esp)
	movl	$4, (%esp)
	call	syslog
	movl	argv0, %edx
	movl	stderr, %eax
	movl	%edx, 8(%esp)
	movl	$.LC55, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_fprintf
.L70:
	movl	$.LC47, 4(%esp)
	leal	535(%esp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcpy
	leal	535(%esp), %eax
	movl	%eax, (%esp)
	call	chdir
	testl	%eax, %eax
	jns	.L68
	movl	$.LC56, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$.LC57, (%esp)
	call	perror
	movl	$1, (%esp)
	call	exit
.L68:
	movl	data_dir, %eax
	testl	%eax, %eax
	je	.L72
	movl	data_dir, %eax
	movl	%eax, (%esp)
	call	chdir
	testl	%eax, %eax
	jns	.L72
	movl	$.LC58, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$.LC59, (%esp)
	call	perror
	movl	$1, (%esp)
	call	exit
.L72:
	movl	$handle_term, 4(%esp)
	movl	$15, (%esp)
	call	sigset
	movl	$handle_term, 4(%esp)
	movl	$2, (%esp)
	call	sigset
	movl	$handle_chld, 4(%esp)
	movl	$17, (%esp)
	call	sigset
	movl	$1, 4(%esp)
	movl	$13, (%esp)
	call	sigset
	movl	$handle_hup, 4(%esp)
	movl	$1, (%esp)
	call	sigset
	movl	$handle_usr1, 4(%esp)
	movl	$10, (%esp)
	call	sigset
	movl	$handle_usr2, 4(%esp)
	movl	$12, (%esp)
	call	sigset
	movl	$handle_alrm, 4(%esp)
	movl	$14, (%esp)
	call	sigset
	movl	$0, got_hup
	movl	$0, got_usr1
	movl	$0, watchdog_flag
	movl	$360, (%esp)
	call	alarm
	call	tmr_init
	movl	no_empty_referers, %eax
	movl	%eax, 252(%esp)
	movl	local_pattern, %edx
	movl	%edx, 248(%esp)
	movl	url_pattern, %ecx
	movl	%ecx, 244(%esp)
	movl	do_global_passwd, %eax
	movl	%eax, 240(%esp)
	movl	do_vhost, %edx
	movl	%edx, 236(%esp)
	movl	no_symlink_check, %ecx
	movl	%ecx, 232(%esp)
	movl	no_log, %eax
	movl	%eax, 228(%esp)
	movl	max_age, %edx
	movl	%edx, 224(%esp)
	movl	p3p, %ecx
	movl	%ecx, 220(%esp)
	movl	charset, %eax
	movl	%eax, 216(%esp)
	movl	cgi_limit, %edx
	movl	%edx, 212(%esp)
	movl	cgi_pattern, %ecx
	movl	%ecx, 208(%esp)
	movzwl	port, %eax
	movzwl	%ax, %eax
	movl	%eax, 204(%esp)
	movl	268(%esp), %eax
	testl	%eax, %eax
	je	.L73
	leal	276(%esp), %ebx
	jmp	.L74
.L73:
	movl	$0, %ebx
.L74:
	movl	272(%esp), %eax
	testl	%eax, %eax
	je	.L75
	leal	404(%esp), %edx
	jmp	.L76
.L75:
	movl	$0, %edx
.L76:
	movl	hostname, %ecx
	movl	252(%esp), %eax
	movl	%eax, 68(%esp)
	movl	248(%esp), %eax
	movl	%eax, 64(%esp)
	movl	244(%esp), %eax
	movl	%eax, 60(%esp)
	movl	240(%esp), %eax
	movl	%eax, 56(%esp)
	movl	236(%esp), %eax
	movl	%eax, 52(%esp)
	movl	232(%esp), %eax
	movl	%eax, 48(%esp)
	movl	4656(%esp), %eax
	movl	%eax, 44(%esp)
	movl	228(%esp), %eax
	movl	%eax, 40(%esp)
	leal	535(%esp), %eax
	movl	%eax, 36(%esp)
	movl	224(%esp), %eax
	movl	%eax, 32(%esp)
	movl	220(%esp), %eax
	movl	%eax, 28(%esp)
	movl	216(%esp), %eax
	movl	%eax, 24(%esp)
	movl	212(%esp), %eax
	movl	%eax, 20(%esp)
	movl	208(%esp), %eax
	movl	%eax, 16(%esp)
	movl	204(%esp), %eax
	movl	%eax, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	call	httpd_initialize
	movl	%eax, hs
	movl	hs, %eax
	testl	%eax, %eax
	jne	.L77
	movl	$1, (%esp)
	call	exit
.L77:
	movl	$1, 16(%esp)
	movl	$120000, 12(%esp)
	movl	JunkClientData, %eax
	movl	%eax, 8(%esp)
	movl	$occasional, 4(%esp)
	movl	$0, (%esp)
	call	tmr_create
	testl	%eax, %eax
	jne	.L78
	movl	$.LC60, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L78:
	movl	$1, 16(%esp)
	movl	$5000, 12(%esp)
	movl	JunkClientData, %eax
	movl	%eax, 8(%esp)
	movl	$idle, 4(%esp)
	movl	$0, (%esp)
	call	tmr_create
	testl	%eax, %eax
	jne	.L79
	movl	$.LC61, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L79:
	movl	numthrottles, %eax
	testl	%eax, %eax
	jle	.L80
	movl	$1, 16(%esp)
	movl	$2000, 12(%esp)
	movl	JunkClientData, %eax
	movl	%eax, 8(%esp)
	movl	$update_throttles, 4(%esp)
	movl	$0, (%esp)
	call	tmr_create
	testl	%eax, %eax
	jne	.L80
	movl	$.LC62, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L80:
	movl	$1, 16(%esp)
	movl	$3600000, 12(%esp)
	movl	JunkClientData, %eax
	movl	%eax, 8(%esp)
	movl	$show_stats, 4(%esp)
	movl	$0, (%esp)
	call	tmr_create
	testl	%eax, %eax
	jne	.L81
	movl	$.LC63, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L81:
	movl	$0, (%esp)
	call	__mfwrap_time
	movl	%eax, stats_time
	movl	stats_time, %eax
	movl	%eax, start_time
	movl	$0, stats_connections
	movl	$0, stats_bytes
	movl	$0, stats_simultaneous
	call	getuid
	testl	%eax, %eax
	jne	.L82
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	call	setgroups
	testl	%eax, %eax
	jns	.L83
	movl	$.LC64, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L83:
	movl	4660(%esp), %eax
	movl	%eax, (%esp)
	call	setgid
	testl	%eax, %eax
	jns	.L84
	movl	$.LC65, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L84:
	movl	user, %eax
	movl	4660(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	initgroups
	testl	%eax, %eax
	jns	.L85
	movl	$.LC66, 4(%esp)
	movl	$4, (%esp)
	call	syslog
.L85:
	movl	4664(%esp), %eax
	movl	%eax, (%esp)
	call	setuid
	testl	%eax, %eax
	jns	.L86
	movl	$.LC67, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L86:
	movl	do_chroot, %eax
	testl	%eax, %eax
	jne	.L82
	movl	$.LC68, 4(%esp)
	movl	$4, (%esp)
	call	syslog
.L82:
	movl	max_connects, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, connects
	movl	connects, %eax
	testl	%eax, %eax
	jne	.L87
	movl	$.LC69, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L87:
	movl	$0, 4652(%esp)
	jmp	.L88
.L92:
	movl	connects, %ecx
	movl	4652(%esp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	movl	%ebx, %eax
	addl	$3, %eax
	movl	%eax, 160(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	193(%esp)
	movl	4(%ecx), %eax
	cmpl	160(%esp), %eax
	setb	%al
	orb	193(%esp), %al
	testb	%al, %al
	je	.L89
	movl	160(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC70, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L89:
	movl	$0, (%ebx)
	movl	connects, %ecx
	movl	4652(%esp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	addl	%ecx, %eax
	movl	%eax, 200(%esp)
	movl	4652(%esp), %eax
	addl	$1, %eax
	movl	%eax, 196(%esp)
	movl	200(%esp), %ebx
	movl	200(%esp), %eax
	addl	$4, %eax
	addl	$3, %eax
	movl	%eax, 156(%esp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	156(%esp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L90
	movl	156(%esp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC71, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L90:
	movl	196(%esp), %edx
	movl	200(%esp), %eax
	movl	%edx, 4(%eax)
	movl	connects, %ecx
	movl	4652(%esp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	8(%ebx), %eax
	addl	$3, %eax
	movl	%eax, 152(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	192(%esp)
	movl	4(%ecx), %eax
	cmpl	152(%esp), %eax
	setb	%al
	orb	192(%esp), %al
	testb	%al, %al
	je	.L91
	movl	152(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC72, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L91:
	movl	$0, 8(%ebx)
	addl	$1, 4652(%esp)
.L88:
	movl	max_connects, %eax
	cmpl	%eax, 4652(%esp)
	jl	.L92
	movl	connects, %ecx
	movl	max_connects, %eax
	leal	-1(%eax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	4(%ebx), %eax
	addl	$3, %eax
	movl	%eax, 148(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	191(%esp)
	movl	4(%ecx), %eax
	cmpl	148(%esp), %eax
	setb	%al
	orb	191(%esp), %al
	testb	%al, %al
	je	.L93
	movl	148(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC73, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L93:
	movl	$-1, 4(%ebx)
	movl	$0, first_free_connect
	movl	$0, num_connects
	movl	$0, httpd_conn_count
	movl	hs, %eax
	testl	%eax, %eax
	je	.L94
	movl	hs, %ebx
	movl	%ebx, %edx
	leal	40(%ebx), %eax
	addl	$3, %eax
	movl	%eax, 144(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	190(%esp)
	movl	4(%ecx), %eax
	cmpl	144(%esp), %eax
	setb	%al
	orb	190(%esp), %al
	testb	%al, %al
	je	.L95
	movl	144(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC74, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L95:
	movl	40(%ebx), %eax
	cmpl	$-1, %eax
	je	.L96
	movl	hs, %ebx
	movl	%ebx, %edx
	leal	40(%ebx), %eax
	addl	$3, %eax
	movl	%eax, 140(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	189(%esp)
	movl	4(%ecx), %eax
	cmpl	140(%esp), %eax
	setb	%al
	orb	189(%esp), %al
	testb	%al, %al
	je	.L97
	movl	140(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC75, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L97:
	movl	40(%ebx), %eax
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	fdwatch_add_fd
.L96:
	movl	hs, %ebx
	movl	%ebx, %edx
	leal	44(%ebx), %eax
	addl	$3, %eax
	movl	%eax, 136(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	188(%esp)
	movl	4(%ecx), %eax
	cmpl	136(%esp), %eax
	setb	%al
	orb	188(%esp), %al
	testb	%al, %al
	je	.L98
	movl	136(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC76, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L98:
	movl	44(%ebx), %eax
	cmpl	$-1, %eax
	je	.L94
	movl	hs, %ebx
	movl	%ebx, %edx
	leal	44(%ebx), %eax
	addl	$3, %eax
	movl	%eax, 132(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	187(%esp)
	movl	4(%ecx), %eax
	cmpl	132(%esp), %eax
	setb	%al
	orb	187(%esp), %al
	testb	%al, %al
	je	.L99
	movl	132(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC77, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L99:
	movl	44(%ebx), %eax
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	fdwatch_add_fd
.L94:
	leal	260(%esp), %eax
	movl	%eax, (%esp)
	call	tmr_prepare_timeval
	jmp	.L100
.L132:
	movl	got_hup, %eax
	testl	%eax, %eax
	je	.L101
	call	re_open_logfile
	movl	$0, got_hup
.L101:
	leal	260(%esp), %eax
	movl	%eax, (%esp)
	call	tmr_mstimeout
	movl	%eax, (%esp)
	call	fdwatch
	movl	%eax, 4640(%esp)
	cmpl	$0, 4640(%esp)
	jns	.L102
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	leal	3(%ebx), %eax
	movl	%eax, 128(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	186(%esp)
	movl	4(%ecx), %eax
	cmpl	128(%esp), %eax
	setb	%al
	orb	186(%esp), %al
	testb	%al, %al
	je	.L103
	movl	128(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC78, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L103:
	movl	(%ebx), %eax
	cmpl	$4, %eax
	je	.L133
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	leal	3(%ebx), %eax
	movl	%eax, 124(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	185(%esp)
	movl	4(%ecx), %eax
	cmpl	124(%esp), %eax
	setb	%al
	orb	185(%esp), %al
	testb	%al, %al
	je	.L105
	movl	124(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC79, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L105:
	movl	(%ebx), %eax
	cmpl	$11, %eax
	je	.L133
.L106:
	movl	$.LC80, 4(%esp)
	movl	$3, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L102:
	leal	260(%esp), %eax
	movl	%eax, (%esp)
	call	tmr_prepare_timeval
	cmpl	$0, 4640(%esp)
	jne	.L107
	leal	260(%esp), %eax
	movl	%eax, (%esp)
	call	tmr_run
	jmp	.L100
.L107:
	movl	hs, %eax
	testl	%eax, %eax
	je	.L108
	movl	hs, %ebx
	movl	%ebx, %edx
	leal	44(%ebx), %eax
	addl	$3, %eax
	movl	%eax, 120(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	184(%esp)
	movl	4(%ecx), %eax
	cmpl	120(%esp), %eax
	setb	%al
	orb	184(%esp), %al
	testb	%al, %al
	je	.L109
	movl	120(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC81, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L109:
	movl	44(%ebx), %eax
	cmpl	$-1, %eax
	je	.L108
	movl	hs, %ebx
	movl	%ebx, %edx
	leal	44(%ebx), %eax
	addl	$3, %eax
	movl	%eax, 116(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	183(%esp)
	movl	4(%ecx), %eax
	cmpl	116(%esp), %eax
	setb	%al
	orb	183(%esp), %al
	testb	%al, %al
	je	.L110
	movl	116(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC82, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L110:
	movl	44(%ebx), %eax
	movl	%eax, (%esp)
	call	fdwatch_check_fd
	testl	%eax, %eax
	je	.L108
	movl	hs, %ebx
	movl	%ebx, %edx
	leal	44(%ebx), %eax
	addl	$3, %eax
	movl	%eax, 112(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	182(%esp)
	movl	4(%ecx), %eax
	cmpl	112(%esp), %eax
	setb	%al
	orb	182(%esp), %al
	testb	%al, %al
	je	.L111
	movl	112(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC83, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L111:
	movl	44(%ebx), %eax
	movl	%eax, 4(%esp)
	leal	260(%esp), %eax
	movl	%eax, (%esp)
	call	handle_newconnect
	testl	%eax, %eax
	jne	.L134
.L108:
	movl	hs, %eax
	testl	%eax, %eax
	je	.L116
	movl	hs, %ebx
	movl	%ebx, %edx
	leal	40(%ebx), %eax
	addl	$3, %eax
	movl	%eax, 108(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	181(%esp)
	movl	4(%ecx), %eax
	cmpl	108(%esp), %eax
	setb	%al
	orb	181(%esp), %al
	testb	%al, %al
	je	.L113
	movl	108(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC84, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L113:
	movl	40(%ebx), %eax
	cmpl	$-1, %eax
	je	.L116
	movl	hs, %ebx
	movl	%ebx, %edx
	leal	40(%ebx), %eax
	addl	$3, %eax
	movl	%eax, 104(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	180(%esp)
	movl	4(%ecx), %eax
	cmpl	104(%esp), %eax
	setb	%al
	orb	180(%esp), %al
	testb	%al, %al
	je	.L114
	movl	104(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC85, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L114:
	movl	40(%ebx), %eax
	movl	%eax, (%esp)
	call	fdwatch_check_fd
	testl	%eax, %eax
	je	.L116
	movl	hs, %ebx
	movl	%ebx, %edx
	leal	40(%ebx), %eax
	addl	$3, %eax
	movl	%eax, 100(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	179(%esp)
	movl	4(%ecx), %eax
	cmpl	100(%esp), %eax
	setb	%al
	orb	179(%esp), %al
	testb	%al, %al
	je	.L115
	movl	100(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC86, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L115:
	movl	40(%ebx), %eax
	movl	%eax, 4(%esp)
	leal	260(%esp), %eax
	movl	%eax, (%esp)
	call	handle_newconnect
	testl	%eax, %eax
	je	.L116
	jmp	.L100
.L125:
	cmpl	$0, 4636(%esp)
	je	.L135
.L117:
	movl	4636(%esp), %eax
	movl	4636(%esp), %edx
	addl	$8, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L118
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC87, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L118:
	movl	4636(%esp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4632(%esp)
	movl	4632(%esp), %eax
	movl	4632(%esp), %edx
	addl	$448, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L119
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC88, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L119:
	movl	4632(%esp), %eax
	movl	448(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_check_fd
	testl	%eax, %eax
	jne	.L120
	leal	260(%esp), %eax
	movl	%eax, 4(%esp)
	movl	4636(%esp), %eax
	movl	%eax, (%esp)
	call	clear_connection
	jmp	.L116
.L120:
	movl	4636(%esp), %eax
	movl	4636(%esp), %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L121
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC89, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L121:
	movl	4636(%esp), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	je	.L123
	cmpl	$4, %eax
	je	.L124
	cmpl	$1, %eax
	jne	.L116
.L122:
	leal	260(%esp), %eax
	movl	%eax, 4(%esp)
	movl	4636(%esp), %eax
	movl	%eax, (%esp)
	call	handle_read
	jmp	.L116
.L123:
	leal	260(%esp), %eax
	movl	%eax, 4(%esp)
	movl	4636(%esp), %eax
	movl	%eax, (%esp)
	call	handle_send
	jmp	.L116
.L124:
	leal	260(%esp), %eax
	movl	%eax, 4(%esp)
	movl	4636(%esp), %eax
	movl	%eax, (%esp)
	call	handle_linger
	jmp	.L116
.L135:
	nop
.L116:
	call	fdwatch_get_next_client_data
	movl	%eax, 4636(%esp)
	cmpl	$-1, 4636(%esp)
	jne	.L125
	leal	260(%esp), %eax
	movl	%eax, (%esp)
	call	tmr_run
	movl	got_usr1, %eax
	testl	%eax, %eax
	je	.L100
	movl	terminate, %eax
	testl	%eax, %eax
	jne	.L100
	movl	$1, terminate
	movl	hs, %eax
	testl	%eax, %eax
	je	.L100
	movl	hs, %ebx
	movl	%ebx, %edx
	leal	40(%ebx), %eax
	addl	$3, %eax
	movl	%eax, 96(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	178(%esp)
	movl	4(%ecx), %eax
	cmpl	96(%esp), %eax
	setb	%al
	orb	178(%esp), %al
	testb	%al, %al
	je	.L126
	movl	96(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC90, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L126:
	movl	40(%ebx), %eax
	cmpl	$-1, %eax
	je	.L127
	movl	hs, %ebx
	movl	%ebx, %edx
	leal	40(%ebx), %eax
	addl	$3, %eax
	movl	%eax, 92(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	177(%esp)
	movl	4(%ecx), %eax
	cmpl	92(%esp), %eax
	setb	%al
	orb	177(%esp), %al
	testb	%al, %al
	je	.L128
	movl	92(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC91, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L128:
	movl	40(%ebx), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
.L127:
	movl	hs, %ebx
	movl	%ebx, %edx
	leal	44(%ebx), %eax
	addl	$3, %eax
	movl	%eax, 88(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	176(%esp)
	movl	4(%ecx), %eax
	cmpl	88(%esp), %eax
	setb	%al
	orb	176(%esp), %al
	testb	%al, %al
	je	.L129
	movl	88(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC92, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L129:
	movl	44(%ebx), %eax
	cmpl	$-1, %eax
	je	.L130
	movl	hs, %ebx
	movl	%ebx, %edx
	leal	44(%ebx), %eax
	addl	$3, %eax
	movl	%eax, 84(%esp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	175(%esp)
	movl	4(%ecx), %eax
	cmpl	84(%esp), %eax
	setb	%al
	orb	175(%esp), %al
	testb	%al, %al
	je	.L131
	movl	84(%esp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC93, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L131:
	movl	44(%ebx), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
.L130:
	movl	hs, %eax
	movl	%eax, (%esp)
	call	httpd_unlisten
	jmp	.L100
.L133:
	nop
	jmp	.L100
.L134:
	nop
.L100:
	movl	terminate, %eax
	testl	%eax, %eax
	je	.L132
	movl	num_connects, %eax
	testl	%eax, %eax
	jg	.L132
	call	shut_down
	movl	$.LC14, 4(%esp)
	movl	$5, (%esp)
	call	syslog
	call	closelog
	movl	$0, (%esp)
	call	exit
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata
.LC94:
	.string	"nobody"
.LC95:
	.string	"iso-8859-1"
.LC96:
	.string	""
.LC97:
	.string	"thttpd.c:881:13 (parse_args)"
.LC98:
	.string	"-V"
.LC99:
	.string	"thttpd/2.26.2 April 4, 2012"
.LC100:
	.string	"%s\n"
.LC101:
	.string	"thttpd.c:886:18 (parse_args)"
.LC102:
	.string	"-C"
.LC103:
	.string	"thttpd.c:889:17 (parse_args)"
.LC104:
	.string	"thttpd.c:891:18 (parse_args)"
.LC105:
	.string	"-p"
.LC106:
	.string	"thttpd.c:894:34 (parse_args)"
.LC107:
	.string	"thttpd.c:896:18 (parse_args)"
.LC108:
	.string	"-d"
.LC109:
	.string	"thttpd.c:899:16 (parse_args)"
.LC110:
	.string	"thttpd.c:901:18 (parse_args)"
.LC111:
	.string	"-r"
.LC112:
	.string	"thttpd.c:906:18 (parse_args)"
.LC113:
	.string	"-nor"
.LC114:
	.string	"thttpd.c:911:18 (parse_args)"
.LC115:
	.string	"-dd"
.LC116:
	.string	"thttpd.c:914:21 (parse_args)"
.LC117:
	.string	"thttpd.c:916:18 (parse_args)"
.LC118:
	.string	"-s"
.LC119:
	.string	"thttpd.c:918:18 (parse_args)"
.LC120:
	.string	"-nos"
.LC121:
	.string	"thttpd.c:920:18 (parse_args)"
.LC122:
	.string	"-u"
.LC123:
	.string	"thttpd.c:923:17 (parse_args)"
.LC124:
	.string	"thttpd.c:925:18 (parse_args)"
.LC125:
	.string	"-c"
.LC126:
	.string	"thttpd.c:928:24 (parse_args)"
.LC127:
	.string	"thttpd.c:930:18 (parse_args)"
.LC128:
	.string	"-t"
.LC129:
	.string	"thttpd.c:933:25 (parse_args)"
.LC130:
	.string	"thttpd.c:935:18 (parse_args)"
.LC131:
	.string	"-h"
.LC132:
	.string	"thttpd.c:938:21 (parse_args)"
.LC133:
	.string	"thttpd.c:940:18 (parse_args)"
.LC134:
	.string	"-l"
.LC135:
	.string	"thttpd.c:943:20 (parse_args)"
.LC136:
	.string	"thttpd.c:945:18 (parse_args)"
.LC137:
	.string	"-v"
.LC138:
	.string	"thttpd.c:947:18 (parse_args)"
.LC139:
	.string	"-nov"
.LC140:
	.string	"thttpd.c:949:18 (parse_args)"
.LC141:
	.string	"-g"
.LC142:
	.string	"thttpd.c:951:18 (parse_args)"
.LC143:
	.string	"-nog"
.LC144:
	.string	"thttpd.c:953:18 (parse_args)"
.LC145:
	.string	"-i"
.LC146:
	.string	"thttpd.c:956:20 (parse_args)"
.LC147:
	.string	"thttpd.c:958:18 (parse_args)"
.LC148:
	.string	"-T"
.LC149:
	.string	"thttpd.c:961:20 (parse_args)"
.LC150:
	.string	"thttpd.c:963:18 (parse_args)"
.LC151:
	.string	"-P"
.LC152:
	.string	"thttpd.c:966:16 (parse_args)"
.LC153:
	.string	"thttpd.c:968:18 (parse_args)"
.LC154:
	.string	"-M"
.LC155:
	.string	"thttpd.c:971:20 (parse_args)"
.LC156:
	.string	"thttpd.c:973:18 (parse_args)"
.LC157:
	.string	"-D"
.LC158:
	.string	"thttpd.c:879:32 (parse_args)"
.LC159:
	.string	"thttpd.c:879:42 (parse_args)"
	.text
	.type	parse_args, @function
parse_args:
.LFB8:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$236, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
	movl	$0, debug
	movw	$80, port
	movl	$0, dir
	movl	$0, data_dir
	movl	$0, do_chroot
	movl	$0, no_log
	movl	do_chroot, %eax
	movl	%eax, no_symlink_check
	movl	$0, do_vhost
	movl	$0, do_global_passwd
	movl	$0, cgi_pattern
	movl	$0, cgi_limit
	movl	$0, url_pattern
	movl	$0, no_empty_referers
	movl	$0, local_pattern
	movl	$0, throttlefile
	movl	$0, hostname
	movl	$0, logfile
	movl	$0, pidfile
	movl	$.LC94, user
	movl	$.LC95, charset
	movl	$.LC96, p3p
	movl	$-1, max_age
	movl	$1, -28(%ebp)
	jmp	.L137
.L201:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -92(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-41(%ebp)
	movl	4(%ecx), %eax
	cmpl	-92(%ebp), %eax
	setb	%al
	orb	-41(%ebp), %al
	testb	%al, %al
	je	.L138
	movl	-92(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC97, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L138:
	movl	(%edi), %eax
	movl	$.LC98, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L139
	movl	$.LC99, 4(%esp)
	movl	$.LC100, (%esp)
	call	__mfwrap_printf
	movl	$0, (%esp)
	call	exit
.L139:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -96(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-42(%ebp)
	movl	4(%ecx), %eax
	cmpl	-96(%ebp), %eax
	setb	%al
	orb	-42(%ebp), %al
	testb	%al, %al
	je	.L140
	movl	-96(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC101, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L140:
	movl	(%edi), %eax
	movl	$.LC102, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L141
	movl	-28(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L141
	addl	$1, -28(%ebp)
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -100(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-43(%ebp)
	movl	4(%ecx), %eax
	cmpl	-100(%ebp), %eax
	setb	%al
	orb	-43(%ebp), %al
	testb	%al, %al
	je	.L142
	movl	-100(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC103, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L142:
	movl	(%edi), %eax
	movl	%eax, (%esp)
	call	read_config
	jmp	.L143
.L141:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -104(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-44(%ebp)
	movl	4(%ecx), %eax
	cmpl	-104(%ebp), %eax
	setb	%al
	orb	-44(%ebp), %al
	testb	%al, %al
	je	.L144
	movl	-104(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC104, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L144:
	movl	(%edi), %eax
	movl	$.LC105, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L145
	movl	-28(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L145
	addl	$1, -28(%ebp)
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -108(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-45(%ebp)
	movl	4(%ecx), %eax
	cmpl	-108(%ebp), %eax
	setb	%al
	orb	-45(%ebp), %al
	testb	%al, %al
	je	.L146
	movl	-108(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC106, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L146:
	movl	(%edi), %eax
	movl	%eax, (%esp)
	call	atoi
	movw	%ax, port
	jmp	.L143
.L145:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -112(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-46(%ebp)
	movl	4(%ecx), %eax
	cmpl	-112(%ebp), %eax
	setb	%al
	orb	-46(%ebp), %al
	testb	%al, %al
	je	.L147
	movl	-112(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC107, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L147:
	movl	(%edi), %eax
	movl	$.LC108, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L148
	movl	-28(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L148
	addl	$1, -28(%ebp)
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -116(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-47(%ebp)
	movl	4(%ecx), %eax
	cmpl	-116(%ebp), %eax
	setb	%al
	orb	-47(%ebp), %al
	testb	%al, %al
	je	.L149
	movl	-116(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC109, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L149:
	movl	(%edi), %eax
	movl	%eax, dir
	jmp	.L143
.L148:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -120(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-48(%ebp)
	movl	4(%ecx), %eax
	cmpl	-120(%ebp), %eax
	setb	%al
	orb	-48(%ebp), %al
	testb	%al, %al
	je	.L150
	movl	-120(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC110, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L150:
	movl	(%edi), %eax
	movl	$.LC111, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L151
	movl	$1, do_chroot
	movl	$1, no_symlink_check
	jmp	.L143
.L151:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -124(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-49(%ebp)
	movl	4(%ecx), %eax
	cmpl	-124(%ebp), %eax
	setb	%al
	orb	-49(%ebp), %al
	testb	%al, %al
	je	.L152
	movl	-124(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC112, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L152:
	movl	(%edi), %eax
	movl	$.LC113, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L153
	movl	$0, do_chroot
	movl	$0, no_symlink_check
	jmp	.L143
.L153:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -128(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-50(%ebp)
	movl	4(%ecx), %eax
	cmpl	-128(%ebp), %eax
	setb	%al
	orb	-50(%ebp), %al
	testb	%al, %al
	je	.L154
	movl	-128(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC114, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L154:
	movl	(%edi), %eax
	movl	$.LC115, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L155
	movl	-28(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L155
	addl	$1, -28(%ebp)
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -132(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-51(%ebp)
	movl	4(%ecx), %eax
	cmpl	-132(%ebp), %eax
	setb	%al
	orb	-51(%ebp), %al
	testb	%al, %al
	je	.L156
	movl	-132(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC116, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L156:
	movl	(%edi), %eax
	movl	%eax, data_dir
	jmp	.L143
.L155:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -136(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-52(%ebp)
	movl	4(%ecx), %eax
	cmpl	-136(%ebp), %eax
	setb	%al
	orb	-52(%ebp), %al
	testb	%al, %al
	je	.L157
	movl	-136(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC117, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L157:
	movl	(%edi), %eax
	movl	$.LC118, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L158
	movl	$0, no_symlink_check
	jmp	.L143
.L158:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -140(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-53(%ebp)
	movl	4(%ecx), %eax
	cmpl	-140(%ebp), %eax
	setb	%al
	orb	-53(%ebp), %al
	testb	%al, %al
	je	.L159
	movl	-140(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC119, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L159:
	movl	(%edi), %eax
	movl	$.LC120, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L160
	movl	$1, no_symlink_check
	jmp	.L143
.L160:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -144(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-54(%ebp)
	movl	4(%ecx), %eax
	cmpl	-144(%ebp), %eax
	setb	%al
	orb	-54(%ebp), %al
	testb	%al, %al
	je	.L161
	movl	-144(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC121, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L161:
	movl	(%edi), %eax
	movl	$.LC122, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L162
	movl	-28(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L162
	addl	$1, -28(%ebp)
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -148(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-55(%ebp)
	movl	4(%ecx), %eax
	cmpl	-148(%ebp), %eax
	setb	%al
	orb	-55(%ebp), %al
	testb	%al, %al
	je	.L163
	movl	-148(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC123, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L163:
	movl	(%edi), %eax
	movl	%eax, user
	jmp	.L143
.L162:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -152(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-56(%ebp)
	movl	4(%ecx), %eax
	cmpl	-152(%ebp), %eax
	setb	%al
	orb	-56(%ebp), %al
	testb	%al, %al
	je	.L164
	movl	-152(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC124, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L164:
	movl	(%edi), %eax
	movl	$.LC125, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L165
	movl	-28(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L165
	addl	$1, -28(%ebp)
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -156(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-57(%ebp)
	movl	4(%ecx), %eax
	cmpl	-156(%ebp), %eax
	setb	%al
	orb	-57(%ebp), %al
	testb	%al, %al
	je	.L166
	movl	-156(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC126, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L166:
	movl	(%edi), %eax
	movl	%eax, cgi_pattern
	jmp	.L143
.L165:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -160(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-58(%ebp)
	movl	4(%ecx), %eax
	cmpl	-160(%ebp), %eax
	setb	%al
	orb	-58(%ebp), %al
	testb	%al, %al
	je	.L167
	movl	-160(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC127, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L167:
	movl	(%edi), %eax
	movl	$.LC128, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L168
	movl	-28(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L168
	addl	$1, -28(%ebp)
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -164(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-59(%ebp)
	movl	4(%ecx), %eax
	cmpl	-164(%ebp), %eax
	setb	%al
	orb	-59(%ebp), %al
	testb	%al, %al
	je	.L169
	movl	-164(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC129, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L169:
	movl	(%edi), %eax
	movl	%eax, throttlefile
	jmp	.L143
.L168:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -168(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-60(%ebp)
	movl	4(%ecx), %eax
	cmpl	-168(%ebp), %eax
	setb	%al
	orb	-60(%ebp), %al
	testb	%al, %al
	je	.L170
	movl	-168(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC130, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L170:
	movl	(%edi), %eax
	movl	$.LC131, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L171
	movl	-28(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L171
	addl	$1, -28(%ebp)
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -172(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-61(%ebp)
	movl	4(%ecx), %eax
	cmpl	-172(%ebp), %eax
	setb	%al
	orb	-61(%ebp), %al
	testb	%al, %al
	je	.L172
	movl	-172(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC132, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L172:
	movl	(%edi), %eax
	movl	%eax, hostname
	jmp	.L143
.L171:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -176(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-62(%ebp)
	movl	4(%ecx), %eax
	cmpl	-176(%ebp), %eax
	setb	%al
	orb	-62(%ebp), %al
	testb	%al, %al
	je	.L173
	movl	-176(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC133, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L173:
	movl	(%edi), %eax
	movl	$.LC134, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L174
	movl	-28(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L174
	addl	$1, -28(%ebp)
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -180(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-63(%ebp)
	movl	4(%ecx), %eax
	cmpl	-180(%ebp), %eax
	setb	%al
	orb	-63(%ebp), %al
	testb	%al, %al
	je	.L175
	movl	-180(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC135, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L175:
	movl	(%edi), %eax
	movl	%eax, logfile
	jmp	.L143
.L174:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -184(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-64(%ebp)
	movl	4(%ecx), %eax
	cmpl	-184(%ebp), %eax
	setb	%al
	orb	-64(%ebp), %al
	testb	%al, %al
	je	.L176
	movl	-184(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC136, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L176:
	movl	(%edi), %eax
	movl	$.LC137, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L177
	movl	$1, do_vhost
	jmp	.L143
.L177:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -188(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-65(%ebp)
	movl	4(%ecx), %eax
	cmpl	-188(%ebp), %eax
	setb	%al
	orb	-65(%ebp), %al
	testb	%al, %al
	je	.L178
	movl	-188(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC138, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L178:
	movl	(%edi), %eax
	movl	$.LC139, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L179
	movl	$0, do_vhost
	jmp	.L143
.L179:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -192(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-66(%ebp)
	movl	4(%ecx), %eax
	cmpl	-192(%ebp), %eax
	setb	%al
	orb	-66(%ebp), %al
	testb	%al, %al
	je	.L180
	movl	-192(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC140, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L180:
	movl	(%edi), %eax
	movl	$.LC141, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L181
	movl	$1, do_global_passwd
	jmp	.L143
.L181:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -196(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-67(%ebp)
	movl	4(%ecx), %eax
	cmpl	-196(%ebp), %eax
	setb	%al
	orb	-67(%ebp), %al
	testb	%al, %al
	je	.L182
	movl	-196(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC142, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L182:
	movl	(%edi), %eax
	movl	$.LC143, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L183
	movl	$0, do_global_passwd
	jmp	.L143
.L183:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -200(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-68(%ebp)
	movl	4(%ecx), %eax
	cmpl	-200(%ebp), %eax
	setb	%al
	orb	-68(%ebp), %al
	testb	%al, %al
	je	.L184
	movl	-200(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC144, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L184:
	movl	(%edi), %eax
	movl	$.LC145, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L185
	movl	-28(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L185
	addl	$1, -28(%ebp)
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -204(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-69(%ebp)
	movl	4(%ecx), %eax
	cmpl	-204(%ebp), %eax
	setb	%al
	orb	-69(%ebp), %al
	testb	%al, %al
	je	.L186
	movl	-204(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC146, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L186:
	movl	(%edi), %eax
	movl	%eax, pidfile
	jmp	.L143
.L185:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -208(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-70(%ebp)
	movl	4(%ecx), %eax
	cmpl	-208(%ebp), %eax
	setb	%al
	orb	-70(%ebp), %al
	testb	%al, %al
	je	.L187
	movl	-208(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC147, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L187:
	movl	(%edi), %eax
	movl	$.LC148, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L188
	movl	-28(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L188
	addl	$1, -28(%ebp)
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -212(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-71(%ebp)
	movl	4(%ecx), %eax
	cmpl	-212(%ebp), %eax
	setb	%al
	orb	-71(%ebp), %al
	testb	%al, %al
	je	.L189
	movl	-212(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC149, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L189:
	movl	(%edi), %eax
	movl	%eax, charset
	jmp	.L143
.L188:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -216(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-72(%ebp)
	movl	4(%ecx), %eax
	cmpl	-216(%ebp), %eax
	setb	%al
	orb	-72(%ebp), %al
	testb	%al, %al
	je	.L190
	movl	-216(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC150, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L190:
	movl	(%edi), %eax
	movl	$.LC151, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L191
	movl	-28(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L191
	addl	$1, -28(%ebp)
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -220(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-73(%ebp)
	movl	4(%ecx), %eax
	cmpl	-220(%ebp), %eax
	setb	%al
	orb	-73(%ebp), %al
	testb	%al, %al
	je	.L192
	movl	-220(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC152, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L192:
	movl	(%edi), %eax
	movl	%eax, p3p
	jmp	.L143
.L191:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -224(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-74(%ebp)
	movl	4(%ecx), %eax
	cmpl	-224(%ebp), %eax
	setb	%al
	orb	-74(%ebp), %al
	testb	%al, %al
	je	.L193
	movl	-224(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC153, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L193:
	movl	(%edi), %eax
	movl	$.LC154, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L194
	movl	-28(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L194
	addl	$1, -28(%ebp)
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -228(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-75(%ebp)
	movl	4(%ecx), %eax
	cmpl	-228(%ebp), %eax
	setb	%al
	orb	-75(%ebp), %al
	testb	%al, %al
	je	.L195
	movl	-228(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC155, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L195:
	movl	(%edi), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, max_age
	jmp	.L143
.L194:
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -232(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-76(%ebp)
	movl	4(%ecx), %eax
	cmpl	-232(%ebp), %eax
	setb	%al
	orb	-76(%ebp), %al
	testb	%al, %al
	je	.L196
	movl	-232(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC156, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L196:
	movl	(%edi), %eax
	movl	$.LC157, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L197
	movl	$1, debug
	jmp	.L143
.L197:
	call	usage
.L143:
	addl	$1, -28(%ebp)
.L137:
	movl	-28(%ebp), %eax
	cmpl	8(%ebp), %eax
	jge	.L198
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %edi
	movl	%edi, %edx
	leal	3(%edi), %eax
	movl	%eax, -84(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-77(%ebp)
	movl	4(%ecx), %eax
	cmpl	-84(%ebp), %eax
	setb	%al
	orb	-77(%ebp), %al
	testb	%al, %al
	je	.L199
	movl	-84(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC158, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L199:
	movl	(%edi), %edi
	movl	%edi, %edx
	movl	%edi, -88(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-78(%ebp)
	movl	4(%ecx), %eax
	cmpl	-88(%ebp), %eax
	setb	%al
	orb	-78(%ebp), %al
	testb	%al, %al
	je	.L200
	movl	-88(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC159, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L200:
	movzbl	(%edi), %eax
	cmpb	$45, %al
	je	.L201
.L198:
	movl	-28(%ebp), %eax
	cmpl	8(%ebp), %eax
	je	.L136
	call	usage
.L136:
	addl	$236, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	parse_args, .-parse_args
	.section	.rodata
	.align 4
.LC160:
	.string	"usage:  %s [-C configfile] [-p port] [-d dir] [-r|-nor] [-dd data_dir] [-s|-nos] [-v|-nov] [-g|-nog] [-u user] [-c cgipat] [-t throttles] [-h host] [-l logfile] [-i pidfile] [-T charset] [-P P3P] [-M maxage] [-V] [-D]\n"
	.text
	.type	usage, @function
usage:
.LFB9:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	argv0, %edx
	movl	stderr, %eax
	movl	%edx, 8(%esp)
	movl	$.LC160, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_fprintf
	movl	$1, (%esp)
	call	exit
	.cfi_endproc
.LFE9:
	.size	usage, .-usage
	.section	.rodata
	.align 4
.LC161:
	.string	"thttpd.c:998:10 (read_config) line"
.LC162:
	.string	"r"
	.align 4
.LC163:
	.string	"thttpd.c:1015:10 (read_config)"
.LC164:
	.string	" \t\n\r"
	.align 4
.LC165:
	.string	"thttpd.c:1028:10 (read_config)"
	.align 4
.LC166:
	.string	"thttpd.c:1027:19 (read_config)"
	.align 4
.LC167:
	.string	"thttpd.c:1027:34 (read_config)"
	.align 4
.LC168:
	.string	"thttpd.c:1027:50 (read_config)"
	.align 4
.LC169:
	.string	"thttpd.c:1027:66 (read_config)"
	.align 4
.LC170:
	.string	"thttpd.c:1033:12 (read_config)"
.LC171:
	.string	"debug"
.LC172:
	.string	"port"
.LC173:
	.string	"dir"
.LC174:
	.string	"nochroot"
.LC175:
	.string	"data_dir"
.LC176:
	.string	"symlink"
.LC177:
	.string	"nosymlink"
.LC178:
	.string	"symlinks"
.LC179:
	.string	"nosymlinks"
.LC180:
	.string	"user"
.LC181:
	.string	"cgipat"
.LC182:
	.string	"cgilimit"
.LC183:
	.string	"urlpat"
.LC184:
	.string	"noemptyreferers"
.LC185:
	.string	"localpat"
.LC186:
	.string	"throttles"
.LC187:
	.string	"host"
.LC188:
	.string	"logfile"
.LC189:
	.string	"vhost"
.LC190:
	.string	"novhost"
.LC191:
	.string	"globalpasswd"
.LC192:
	.string	"noglobalpasswd"
.LC193:
	.string	"pidfile"
.LC194:
	.string	"charset"
.LC195:
	.string	"p3p"
.LC196:
	.string	"max_age"
	.align 4
.LC197:
	.string	"%s: unknown config option '%s'\n"
	.align 4
.LC198:
	.string	"thttpd.c:1022:14 (read_config)"
	.text
	.type	read_config, @function
read_config:
.LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$10060, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
	movl	$.LC161, 12(%esp)
	movl	$3, 8(%esp)
	movl	$10000, 4(%esp)
	leal	-10044(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_register
	movl	$.LC162, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_fopen
	movl	%eax, -40(%ebp)
	cmpl	$0, -40(%ebp)
	jne	.L250
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	perror
	movl	$1, (%esp)
	call	exit
.L249:
	movl	$35, 4(%esp)
	leal	-10044(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strchr
	movl	%eax, -28(%ebp)
	cmpl	$0, -28(%ebp)
	je	.L207
	movl	-28(%ebp), %eax
	movl	-28(%ebp), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L208
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC163, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L208:
	movl	-28(%ebp), %eax
	movb	$0, (%eax)
.L207:
	leal	-10044(%ebp), %eax
	movl	%eax, -28(%ebp)
	movl	$.LC164, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	strspn
	addl	%eax, -28(%ebp)
	jmp	.L209
.L248:
	movl	$.LC164, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	strcspn
	movl	-28(%ebp), %edx
	addl	%edx, %eax
	movl	%eax, -32(%ebp)
	jmp	.L210
.L213:
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L211
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC165, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L211:
	movl	-32(%ebp), %eax
	movb	$0, (%eax)
	addl	$1, -32(%ebp)
.L210:
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L212
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC166, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L212:
	movl	-32(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$32, %al
	je	.L213
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L214
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC167, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L214:
	movl	-32(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$9, %al
	je	.L213
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L215
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC168, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L215:
	movl	-32(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$10, %al
	je	.L213
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L216
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC169, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L216:
	movl	-32(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$13, %al
	je	.L213
	movl	-28(%ebp), %eax
	movl	%eax, -44(%ebp)
	movl	$61, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strchr
	movl	%eax, -36(%ebp)
	cmpl	$0, -36(%ebp)
	je	.L217
	movl	-36(%ebp), %eax
	movl	-36(%ebp), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L218
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC170, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L218:
	movl	-36(%ebp), %eax
	movb	$0, (%eax)
	addl	$1, -36(%ebp)
.L217:
	movl	$.LC171, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L219
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, debug
	jmp	.L220
.L219:
	movl	$.LC172, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L221
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	atoi
	movw	%ax, port
	jmp	.L220
.L221:
	movl	$.LC173, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L222
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, dir
	jmp	.L220
.L222:
	movl	$.LC53, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L223
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, do_chroot
	movl	$1, no_symlink_check
	jmp	.L220
.L223:
	movl	$.LC174, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L224
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$0, do_chroot
	movl	$0, no_symlink_check
	jmp	.L220
.L224:
	movl	$.LC175, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L225
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, data_dir
	jmp	.L220
.L225:
	movl	$.LC176, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L226
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$0, no_symlink_check
	jmp	.L220
.L226:
	movl	$.LC177, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L227
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, no_symlink_check
	jmp	.L220
.L227:
	movl	$.LC178, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L228
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$0, no_symlink_check
	jmp	.L220
.L228:
	movl	$.LC179, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L229
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, no_symlink_check
	jmp	.L220
.L229:
	movl	$.LC180, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L230
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, user
	jmp	.L220
.L230:
	movl	$.LC181, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L231
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, cgi_pattern
	jmp	.L220
.L231:
	movl	$.LC182, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L232
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, cgi_limit
	jmp	.L220
.L232:
	movl	$.LC183, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L233
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, url_pattern
	jmp	.L220
.L233:
	movl	$.LC184, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L234
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, no_empty_referers
	jmp	.L220
.L234:
	movl	$.LC185, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L235
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, local_pattern
	jmp	.L220
.L235:
	movl	$.LC186, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L236
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, throttlefile
	jmp	.L220
.L236:
	movl	$.LC187, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L237
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, hostname
	jmp	.L220
.L237:
	movl	$.LC188, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L238
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, logfile
	jmp	.L220
.L238:
	movl	$.LC189, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L239
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, do_vhost
	jmp	.L220
.L239:
	movl	$.LC190, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L240
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$0, do_vhost
	jmp	.L220
.L240:
	movl	$.LC191, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L241
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, do_global_passwd
	jmp	.L220
.L241:
	movl	$.LC192, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L242
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$0, do_global_passwd
	jmp	.L220
.L242:
	movl	$.LC193, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L243
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, pidfile
	jmp	.L220
.L243:
	movl	$.LC194, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L244
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, charset
	jmp	.L220
.L244:
	movl	$.LC195, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L245
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, p3p
	jmp	.L220
.L245:
	movl	$.LC196, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L246
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, max_age
	jmp	.L220
.L246:
	movl	argv0, %edx
	movl	stderr, %eax
	movl	-44(%ebp), %ecx
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$.LC197, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_fprintf
	movl	$1, (%esp)
	call	exit
.L220:
	movl	-32(%ebp), %eax
	movl	%eax, -28(%ebp)
	movl	$.LC164, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	strspn
	addl	%eax, -28(%ebp)
.L209:
	movl	-28(%ebp), %eax
	movl	-28(%ebp), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L247
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC198, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L247:
	movl	-28(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L248
	jmp	.L206
.L250:
	nop
.L206:
	movl	-40(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$10000, 4(%esp)
	leal	-10044(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_fgets
	testl	%eax, %eax
	jne	.L249
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_fclose
	movl	$3, 8(%esp)
	movl	$10000, 4(%esp)
	leal	-10044(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_unregister
	addl	$10060, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE10:
	.size	read_config, .-read_config
	.section	.rodata
	.align 4
.LC199:
	.string	"%s: value required for %s option\n"
	.text
	.type	value_required, @function
value_required:
.LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$0, 12(%ebp)
	jne	.L251
	movl	argv0, %edx
	movl	stderr, %eax
	movl	8(%ebp), %ecx
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$.LC199, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_fprintf
	movl	$1, (%esp)
	call	exit
.L251:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE11:
	.size	value_required, .-value_required
	.section	.rodata
	.align 4
.LC200:
	.string	"%s: no value required for %s option\n"
	.text
	.type	no_value_required, @function
no_value_required:
.LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$0, 12(%ebp)
	je	.L253
	movl	argv0, %edx
	movl	stderr, %eax
	movl	8(%ebp), %ecx
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$.LC200, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_fprintf
	movl	$1, (%esp)
	call	exit
.L253:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE12:
	.size	no_value_required, .-no_value_required
	.section	.rodata
	.align 4
.LC201:
	.string	"out of memory copying a string"
	.align 4
.LC202:
	.string	"%s: out of memory copying a string\n"
	.text
	.type	e_strdup, @function
e_strdup:
.LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strdup
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L256
	movl	$.LC201, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	argv0, %edx
	movl	stderr, %eax
	movl	%edx, 8(%esp)
	movl	$.LC202, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_fprintf
	movl	$1, (%esp)
	call	exit
.L256:
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE13:
	.size	e_strdup, .-e_strdup
	.section	.rodata
	.align 4
.LC203:
	.string	"thttpd.c:1235:21 (lookup_hostname) hints"
	.align 4
.LC204:
	.string	"thttpd.c:1236:10 (lookup_hostname) portstr"
	.align 4
.LC205:
	.string	"thttpd.c:1238:22 (lookup_hostname) ai"
.LC206:
	.string	"%d"
.LC207:
	.string	"getaddrinfo %.80s - %.80s"
.LC208:
	.string	"%s: getaddrinfo %s - %s\n"
	.align 4
.LC209:
	.string	"thttpd.c:1264:14 (lookup_hostname)"
	.align 4
.LC210:
	.string	"thttpd.c:1262:54 (lookup_hostname)"
	.align 4
.LC211:
	.string	"thttpd.c:1278:10 (lookup_hostname)"
	.align 4
.LC212:
	.string	"thttpd.c:1281:21 (lookup_hostname)"
	.align 4
.LC213:
	.string	"thttpd.c:1286:23 (lookup_hostname)"
	.align 4
.LC214:
	.string	"%.80s - sockaddr too small (%lu < %lu)"
	.align 4
.LC215:
	.string	"thttpd.c:1290:16 (lookup_hostname)"
	.align 4
.LC216:
	.string	"thttpd.c:1290:28 (lookup_hostname)"
	.align 4
.LC217:
	.string	"thttpd.c:1291:10 (lookup_hostname)"
	.align 4
.LC218:
	.string	"thttpd.c:1295:10 (lookup_hostname)"
	.align 4
.LC219:
	.string	"thttpd.c:1298:21 (lookup_hostname)"
	.align 4
.LC220:
	.string	"thttpd.c:1303:23 (lookup_hostname)"
	.align 4
.LC221:
	.string	"thttpd.c:1307:16 (lookup_hostname)"
	.align 4
.LC222:
	.string	"thttpd.c:1307:28 (lookup_hostname)"
	.align 4
.LC223:
	.string	"thttpd.c:1308:10 (lookup_hostname)"
	.text
	.type	lookup_hostname, @function
lookup_hostname:
.LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$124, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
	movl	$.LC203, 12(%esp)
	movl	$3, 8(%esp)
	movl	$32, 4(%esp)
	leal	-72(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_register
	movl	$.LC204, 12(%esp)
	movl	$3, 8(%esp)
	movl	$10, 4(%esp)
	leal	-82(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_register
	movl	$.LC205, 12(%esp)
	movl	$3, 8(%esp)
	movl	$4, 4(%esp)
	leal	-88(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_register
	movl	$32, 8(%esp)
	movl	$0, 4(%esp)
	leal	-72(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_memset
	movl	$0, -68(%ebp)
	movl	$1, -72(%ebp)
	movl	$1, -64(%ebp)
	movzwl	port, %eax
	movzwl	%ax, %eax
	movl	%eax, 12(%esp)
	movl	$.LC206, 8(%esp)
	movl	$10, 4(%esp)
	leal	-82(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_snprintf
	movl	hostname, %eax
	leal	-88(%ebp), %edx
	movl	%edx, 12(%esp)
	leal	-72(%ebp), %edx
	movl	%edx, 8(%esp)
	leal	-82(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	getaddrinfo
	movl	%eax, -40(%ebp)
	cmpl	$0, -40(%ebp)
	je	.L259
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_gai_strerror
	movl	hostname, %edx
	movl	%eax, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$.LC207, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_gai_strerror
	movl	hostname, %ebx
	movl	argv0, %ecx
	movl	stderr, %edx
	movl	%eax, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	$.LC208, 4(%esp)
	movl	%edx, (%esp)
	call	__mfwrap_fprintf
	movl	$1, (%esp)
	call	exit
.L259:
	movl	$0, -32(%ebp)
	movl	$0, -36(%ebp)
	movl	-88(%ebp), %eax
	movl	%eax, -28(%ebp)
	jmp	.L260
.L268:
	movl	-28(%ebp), %eax
	movl	-28(%ebp), %edx
	addl	$4, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L261
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC209, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L261:
	movl	-28(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	$2, %eax
	je	.L263
	cmpl	$10, %eax
	jne	.L262
.L264:
	cmpl	$0, -32(%ebp)
	jne	.L287
	movl	-28(%ebp), %eax
	movl	%eax, -32(%ebp)
	jmp	.L287
.L263:
	cmpl	$0, -36(%ebp)
	jne	.L288
	movl	-28(%ebp), %eax
	movl	%eax, -36(%ebp)
	jmp	.L288
.L287:
	nop
	jmp	.L262
.L288:
	nop
.L262:
	movl	-28(%ebp), %eax
	movl	-28(%ebp), %edx
	addl	$28, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L267
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC210, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L267:
	movl	-28(%ebp), %eax
	movl	28(%eax), %eax
	movl	%eax, -28(%ebp)
.L260:
	cmpl	$0, -28(%ebp)
	jne	.L268
	cmpl	$0, -32(%ebp)
	jne	.L269
	movl	28(%ebp), %eax
	movl	28(%ebp), %edx
	addl	$3, %edx
	movl	%edx, %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L270
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC211, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L270:
	movl	28(%ebp), %eax
	movl	$0, (%eax)
	jmp	.L271
.L269:
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$16, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L272
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC212, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L272:
	movl	-32(%ebp), %eax
	movl	16(%eax), %eax
	cmpl	24(%ebp), %eax
	jbe	.L273
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$16, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L274
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC213, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L274:
	movl	-32(%ebp), %eax
	movl	16(%eax), %edx
	movl	hostname, %eax
	movl	%edx, 16(%esp)
	movl	24(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$.LC214, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L273:
	movl	24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_memset
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$16, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L275
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC215, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L275:
	movl	-32(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, -92(%ebp)
	movl	-32(%ebp), %edx
	movl	-32(%ebp), %eax
	addl	$20, %eax
	leal	3(%eax), %edi
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-97(%ebp)
	movl	4(%ecx), %eax
	cmpl	%edi, %eax
	setb	%al
	orb	-97(%ebp), %al
	testb	%al, %al
	je	.L276
	movl	%edi, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC216, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L276:
	movl	-32(%ebp), %eax
	movl	20(%eax), %eax
	movl	-92(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_memmove
	movl	28(%ebp), %eax
	movl	28(%ebp), %edx
	addl	$3, %edx
	movl	%edx, %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L277
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC217, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L277:
	movl	28(%ebp), %eax
	movl	$1, (%eax)
.L271:
	cmpl	$0, -36(%ebp)
	jne	.L278
	movl	16(%ebp), %eax
	movl	16(%ebp), %edx
	addl	$3, %edx
	movl	%edx, %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L279
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC218, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L279:
	movl	16(%ebp), %eax
	movl	$0, (%eax)
	jmp	.L280
.L278:
	movl	-36(%ebp), %eax
	movl	-36(%ebp), %edx
	addl	$16, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L281
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC219, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L281:
	movl	-36(%ebp), %eax
	movl	16(%eax), %eax
	cmpl	12(%ebp), %eax
	jbe	.L282
	movl	-36(%ebp), %eax
	movl	-36(%ebp), %edx
	addl	$16, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L283
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC220, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L283:
	movl	-36(%ebp), %eax
	movl	16(%eax), %edx
	movl	hostname, %eax
	movl	%edx, 16(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$.LC214, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L282:
	movl	12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_memset
	movl	-36(%ebp), %eax
	movl	-36(%ebp), %edx
	addl	$16, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L284
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC221, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L284:
	movl	-36(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, -96(%ebp)
	movl	-36(%ebp), %edx
	movl	-36(%ebp), %eax
	addl	$20, %eax
	leal	3(%eax), %edi
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-98(%ebp)
	movl	4(%ecx), %eax
	cmpl	%edi, %eax
	setb	%al
	orb	-98(%ebp), %al
	testb	%al, %al
	je	.L285
	movl	%edi, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC222, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L285:
	movl	-36(%ebp), %eax
	movl	20(%eax), %eax
	movl	-96(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_memmove
	movl	16(%ebp), %eax
	movl	16(%ebp), %edx
	addl	$3, %edx
	movl	%edx, %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L286
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC223, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L286:
	movl	16(%ebp), %eax
	movl	$1, (%eax)
.L280:
	movl	-88(%ebp), %eax
	movl	%eax, (%esp)
	call	freeaddrinfo
	movl	$3, 8(%esp)
	movl	$32, 4(%esp)
	leal	-72(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_unregister
	movl	$3, 8(%esp)
	movl	$10, 4(%esp)
	leal	-82(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_unregister
	movl	$3, 8(%esp)
	movl	$4, 4(%esp)
	leal	-88(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_unregister
	addl	$124, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE14:
	.size	lookup_hostname, .-lookup_hostname
	.section	.rodata
	.align 4
.LC224:
	.string	"thttpd.c:1368:10 (read_throttlefile) buf"
	.align 4
.LC225:
	.string	"thttpd.c:1371:10 (read_throttlefile) pattern"
	.align 4
.LC226:
	.string	"thttpd.c:1372:10 (read_throttlefile) max_limit"
	.align 4
.LC227:
	.string	"thttpd.c:1372:21 (read_throttlefile) min_limit"
	.align 4
.LC228:
	.string	"thttpd.c:1373:20 (read_throttlefile) tv"
	.align 4
.LC229:
	.string	"thttpd.c:1390:10 (read_throttlefile)"
	.align 4
.LC230:
	.string	"thttpd.c:1397:17 (read_throttlefile)"
	.align 4
.LC231:
	.string	"thttpd.c:1395:8 (read_throttlefile)"
	.align 4
.LC232:
	.string	"thttpd.c:1395:29 (read_throttlefile)"
	.align 4
.LC233:
	.string	"thttpd.c:1396:8 (read_throttlefile)"
	.align 4
.LC234:
	.string	"thttpd.c:1396:30 (read_throttlefile)"
.LC235:
	.string	" %4900[^ \t] %ld-%ld"
.LC236:
	.string	" %4900[^ \t] %ld"
	.align 4
.LC237:
	.string	"unparsable line in %.80s - %.80s"
	.align 4
.LC238:
	.string	"%s: unparsable line in %.80s - %.80s\n"
	.align 4
.LC239:
	.string	"thttpd.c:1419:14 (read_throttlefile)"
.LC240:
	.string	"|/"
	.align 4
.LC241:
	.string	"out of memory allocating a throttletab"
	.align 4
.LC242:
	.string	"%s: out of memory allocating a throttletab\n"
	.align 4
.LC243:
	.string	"thttpd.c:1448:34 (read_throttlefile)"
	.align 4
.LC244:
	.string	"thttpd.c:1449:36 (read_throttlefile)"
	.align 4
.LC245:
	.string	"thttpd.c:1450:36 (read_throttlefile)"
	.align 4
.LC246:
	.string	"thttpd.c:1451:31 (read_throttlefile)"
	.align 4
.LC247:
	.string	"thttpd.c:1452:42 (read_throttlefile)"
	.align 4
.LC248:
	.string	"thttpd.c:1453:38 (read_throttlefile)"
	.text
	.type	read_throttlefile, @function
read_throttlefile:
.LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$10156, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
	movl	$.LC224, 12(%esp)
	movl	$3, 8(%esp)
	movl	$5000, 4(%esp)
	leal	-5036(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_register
	movl	$.LC225, 12(%esp)
	movl	$3, 8(%esp)
	movl	$5000, 4(%esp)
	leal	-10036(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_register
	movl	$.LC226, 12(%esp)
	movl	$3, 8(%esp)
	movl	$4, 4(%esp)
	leal	-10040(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_register
	movl	$.LC227, 12(%esp)
	movl	$3, 8(%esp)
	movl	$4, 4(%esp)
	leal	-10044(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_register
	movl	$.LC228, 12(%esp)
	movl	$3, 8(%esp)
	movl	$8, 4(%esp)
	leal	-10052(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_register
	movl	$.LC162, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_fopen
	movl	%eax, -32(%ebp)
	cmpl	$0, -32(%ebp)
	jne	.L290
	movl	8(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC38, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	perror
	movl	$1, (%esp)
	call	exit
.L290:
	movl	$0, 4(%esp)
	leal	-10052(%ebp), %eax
	movl	%eax, (%esp)
	call	gettimeofday
	jmp	.L291
.L318:
	movl	$35, 4(%esp)
	leal	-5036(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strchr
	movl	%eax, -36(%ebp)
	cmpl	$0, -36(%ebp)
	je	.L292
	movl	-36(%ebp), %eax
	movl	-36(%ebp), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L293
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC229, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L293:
	movl	-36(%ebp), %eax
	movb	$0, (%eax)
.L292:
	leal	-5036(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strlen
	movl	%eax, -28(%ebp)
	jmp	.L294
.L298:
	subl	$1, -28(%ebp)
	leal	-5036(%ebp), %eax
	leal	-5036(%ebp), %ecx
	movl	-28(%ebp), %edx
	addl	%ecx, %edx
	movl	%edx, %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L295
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC230, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L295:
	leal	-5036(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
.L294:
	cmpl	$0, -28(%ebp)
	jle	.L296
	movl	-28(%ebp), %eax
	leal	-1(%eax), %ebx
	leal	-5036(%ebp), %edx
	leal	-5036(%ebp), %eax
	addl	%ebx, %eax
	movl	%eax, -10092(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-10081(%ebp)
	movl	4(%ecx), %eax
	cmpl	-10092(%ebp), %eax
	setb	%al
	orb	-10081(%ebp), %al
	testb	%al, %al
	je	.L297
	movl	-10092(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC231, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L297:
	movzbl	-5036(%ebp,%ebx), %eax
	cmpb	$32, %al
	je	.L298
	movl	-28(%ebp), %eax
	leal	-1(%eax), %ebx
	leal	-5036(%ebp), %edx
	leal	-5036(%ebp), %eax
	addl	%ebx, %eax
	movl	%eax, -10096(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-10082(%ebp)
	movl	4(%ecx), %eax
	cmpl	-10096(%ebp), %eax
	setb	%al
	orb	-10082(%ebp), %al
	testb	%al, %al
	je	.L299
	movl	-10096(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC232, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L299:
	movzbl	-5036(%ebp,%ebx), %eax
	cmpb	$9, %al
	je	.L298
	movl	-28(%ebp), %eax
	leal	-1(%eax), %ebx
	leal	-5036(%ebp), %edx
	leal	-5036(%ebp), %eax
	addl	%ebx, %eax
	movl	%eax, -10100(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-10083(%ebp)
	movl	4(%ecx), %eax
	cmpl	-10100(%ebp), %eax
	setb	%al
	orb	-10083(%ebp), %al
	testb	%al, %al
	je	.L300
	movl	-10100(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC233, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L300:
	movzbl	-5036(%ebp,%ebx), %eax
	cmpb	$10, %al
	je	.L298
	movl	-28(%ebp), %eax
	leal	-1(%eax), %ebx
	leal	-5036(%ebp), %edx
	leal	-5036(%ebp), %eax
	addl	%ebx, %eax
	movl	%eax, -10104(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-10084(%ebp)
	movl	4(%ecx), %eax
	cmpl	-10104(%ebp), %eax
	setb	%al
	orb	-10084(%ebp), %al
	testb	%al, %al
	je	.L301
	movl	-10104(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC234, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L301:
	movzbl	-5036(%ebp,%ebx), %eax
	cmpb	$13, %al
	je	.L298
.L296:
	cmpl	$0, -28(%ebp)
	je	.L319
.L302:
	leal	-10040(%ebp), %eax
	movl	%eax, 16(%esp)
	leal	-10044(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-10036(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC235, 4(%esp)
	leal	-5036(%ebp), %eax
	movl	%eax, (%esp)
	call	__isoc99_sscanf
	cmpl	$3, %eax
	je	.L303
	leal	-10040(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-10036(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC236, 4(%esp)
	leal	-5036(%ebp), %eax
	movl	%eax, (%esp)
	call	__isoc99_sscanf
	cmpl	$2, %eax
	jne	.L304
	movl	$0, -10044(%ebp)
	jmp	.L303
.L304:
	leal	-5036(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC237, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	argv0, %edx
	movl	stderr, %eax
	leal	-5036(%ebp), %ecx
	movl	%ecx, 16(%esp)
	movl	8(%ebp), %ecx
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$.LC238, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_fprintf
	jmp	.L291
.L303:
	leal	-10036(%ebp), %eax
	leal	-10036(%ebp), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L305
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC239, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L305:
	movzbl	-10036(%ebp), %eax
	cmpb	$47, %al
	jne	.L307
	leal	-10036(%ebp), %eax
	addl	$1, %eax
	movl	%eax, 4(%esp)
	leal	-10036(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strcpy
	jmp	.L307
.L308:
	movl	-36(%ebp), %eax
	leal	2(%eax), %edx
	movl	-36(%ebp), %eax
	addl	$1, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_strcpy
.L307:
	movl	$.LC240, 4(%esp)
	leal	-10036(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_strstr
	movl	%eax, -36(%ebp)
	cmpl	$0, -36(%ebp)
	jne	.L308
	movl	numthrottles, %edx
	movl	maxthrottles, %eax
	cmpl	%eax, %edx
	jl	.L309
	movl	maxthrottles, %eax
	testl	%eax, %eax
	jne	.L310
	movl	$100, maxthrottles
	movl	maxthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, throttles
	jmp	.L311
.L310:
	movl	maxthrottles, %eax
	addl	%eax, %eax
	movl	%eax, maxthrottles
	movl	maxthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	%eax, %edx
	movl	throttles, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	realloc
	movl	%eax, throttles
.L311:
	movl	throttles, %eax
	testl	%eax, %eax
	jne	.L309
	movl	$.LC241, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	argv0, %edx
	movl	stderr, %eax
	movl	%edx, 8(%esp)
	movl	$.LC242, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_fprintf
	movl	$1, (%esp)
	call	exit
.L309:
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -10060(%ebp)
	leal	-10036(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, -10064(%ebp)
	movl	-10060(%ebp), %ebx
	movl	-10060(%ebp), %eax
	addl	$3, %eax
	movl	%eax, -10108(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-10108(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L312
	movl	-10108(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC243, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L312:
	movl	-10064(%ebp), %edx
	movl	-10060(%ebp), %eax
	movl	%edx, (%eax)
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -10068(%ebp)
	movl	-10040(%ebp), %ecx
	movl	%ecx, -10072(%ebp)
	movl	-10068(%ebp), %ebx
	movl	-10068(%ebp), %eax
	addl	$4, %eax
	addl	$3, %eax
	movl	%eax, -10112(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-10112(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L313
	movl	-10112(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC244, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L313:
	movl	-10072(%ebp), %edx
	movl	-10068(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -10076(%ebp)
	movl	-10044(%ebp), %ecx
	movl	%ecx, -10080(%ebp)
	movl	-10076(%ebp), %ebx
	movl	-10076(%ebp), %eax
	addl	$8, %eax
	addl	$3, %eax
	movl	%eax, -10116(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-10116(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L314
	movl	-10116(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC245, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L314:
	movl	-10080(%ebp), %edx
	movl	-10076(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	12(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -10120(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-10085(%ebp)
	movl	4(%ecx), %eax
	cmpl	-10120(%ebp), %eax
	setb	%al
	orb	-10085(%ebp), %al
	testb	%al, %al
	je	.L315
	movl	-10120(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC246, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L315:
	movl	$0, 12(%ebx)
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	16(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -10124(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-10086(%ebp)
	movl	4(%ecx), %eax
	cmpl	-10124(%ebp), %eax
	setb	%al
	orb	-10086(%ebp), %al
	testb	%al, %al
	je	.L316
	movl	-10124(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC247, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L316:
	movl	$0, 16(%ebx)
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	20(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -10128(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-10087(%ebp)
	movl	4(%ecx), %eax
	cmpl	-10128(%ebp), %eax
	setb	%al
	orb	-10087(%ebp), %al
	testb	%al, %al
	je	.L317
	movl	-10128(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC248, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L317:
	movl	$0, 20(%ebx)
	movl	numthrottles, %eax
	addl	$1, %eax
	movl	%eax, numthrottles
	jmp	.L291
.L319:
	nop
.L291:
	movl	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$5000, 4(%esp)
	leal	-5036(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_fgets
	testl	%eax, %eax
	jne	.L318
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	__mfwrap_fclose
	movl	$3, 8(%esp)
	movl	$5000, 4(%esp)
	leal	-5036(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_unregister
	movl	$3, 8(%esp)
	movl	$5000, 4(%esp)
	leal	-10036(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_unregister
	movl	$3, 8(%esp)
	movl	$4, 4(%esp)
	leal	-10040(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_unregister
	movl	$3, 8(%esp)
	movl	$4, 4(%esp)
	leal	-10044(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_unregister
	movl	$3, 8(%esp)
	movl	$8, 4(%esp)
	leal	-10052(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_unregister
	addl	$10156, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE15:
	.size	read_throttlefile, .-read_throttlefile
	.section	.rodata
	.align 4
.LC249:
	.string	"thttpd.c:1465:20 (shut_down) tv"
.LC250:
	.string	"thttpd.c:1471:21 (shut_down)"
.LC251:
	.string	"thttpd.c:1472:22 (shut_down)"
.LC252:
	.string	"thttpd.c:1473:21 (shut_down)"
.LC253:
	.string	"thttpd.c:1475:24 (shut_down)"
.LC254:
	.string	"thttpd.c:1476:34 (shut_down)"
.LC255:
	.string	"thttpd.c:1478:24 (shut_down)"
.LC256:
	.string	"thttpd.c:1485:10 (shut_down)"
.LC257:
	.string	"thttpd.c:1486:20 (shut_down)"
.LC258:
	.string	"thttpd.c:1487:10 (shut_down)"
.LC259:
	.string	"thttpd.c:1488:20 (shut_down)"
	.text
	.type	shut_down, @function
shut_down:
.LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$76, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
	movl	$.LC249, 12(%esp)
	movl	$3, 8(%esp)
	movl	$8, 4(%esp)
	leal	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_register
	movl	$0, 4(%esp)
	leal	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	gettimeofday
	leal	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	logstats
	movl	$0, -28(%ebp)
	jmp	.L321
.L330:
	movl	connects, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	movl	%ebx, %eax
	addl	$3, %eax
	movl	%eax, -52(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-41(%ebp)
	movl	4(%ecx), %eax
	cmpl	-52(%ebp), %eax
	setb	%al
	orb	-41(%ebp), %al
	testb	%al, %al
	je	.L322
	movl	-52(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC250, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L322:
	movl	(%ebx), %eax
	testl	%eax, %eax
	je	.L323
	movl	connects, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	8(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -56(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-42(%ebp)
	movl	4(%ecx), %eax
	cmpl	-56(%ebp), %eax
	setb	%al
	orb	-42(%ebp), %al
	testb	%al, %al
	je	.L324
	movl	-56(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC251, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L324:
	movl	8(%ebx), %eax
	leal	-40(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	httpd_close_conn
.L323:
	movl	connects, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	8(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -60(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-43(%ebp)
	movl	4(%ecx), %eax
	cmpl	-60(%ebp), %eax
	setb	%al
	orb	-43(%ebp), %al
	testb	%al, %al
	je	.L325
	movl	-60(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC252, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L325:
	movl	8(%ebx), %eax
	testl	%eax, %eax
	je	.L326
	movl	connects, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	8(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -64(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-44(%ebp)
	movl	4(%ecx), %eax
	cmpl	-64(%ebp), %eax
	setb	%al
	orb	-44(%ebp), %al
	testb	%al, %al
	je	.L327
	movl	-64(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC253, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L327:
	movl	8(%ebx), %eax
	movl	%eax, (%esp)
	call	httpd_destroy_conn
	movl	connects, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	8(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -68(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-45(%ebp)
	movl	4(%ecx), %eax
	cmpl	-68(%ebp), %eax
	setb	%al
	orb	-45(%ebp), %al
	testb	%al, %al
	je	.L328
	movl	-68(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC254, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L328:
	movl	8(%ebx), %eax
	movl	%eax, (%esp)
	call	free
	movl	httpd_conn_count, %eax
	subl	$1, %eax
	movl	%eax, httpd_conn_count
	movl	connects, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	8(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -72(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-46(%ebp)
	movl	4(%ecx), %eax
	cmpl	-72(%ebp), %eax
	setb	%al
	orb	-46(%ebp), %al
	testb	%al, %al
	je	.L329
	movl	-72(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC255, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L329:
	movl	$0, 8(%ebx)
.L326:
	addl	$1, -28(%ebp)
.L321:
	movl	max_connects, %eax
	cmpl	%eax, -28(%ebp)
	jl	.L330
	movl	hs, %eax
	testl	%eax, %eax
	je	.L331
	movl	hs, %eax
	movl	%eax, -32(%ebp)
	movl	$0, hs
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$40, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L332
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC256, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L332:
	movl	-32(%ebp), %eax
	movl	40(%eax), %eax
	cmpl	$-1, %eax
	je	.L333
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$40, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L334
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC257, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L334:
	movl	-32(%ebp), %eax
	movl	40(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
.L333:
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$44, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L335
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC258, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L335:
	movl	-32(%ebp), %eax
	movl	44(%eax), %eax
	cmpl	$-1, %eax
	je	.L336
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$44, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L337
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC259, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L337:
	movl	-32(%ebp), %eax
	movl	44(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
.L336:
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_terminate
.L331:
	call	mmc_destroy
	call	tmr_destroy
	movl	connects, %eax
	movl	%eax, (%esp)
	call	free
	movl	throttles, %eax
	testl	%eax, %eax
	je	.L338
	movl	throttles, %eax
	movl	%eax, (%esp)
	call	free
.L338:
	movl	$3, 8(%esp)
	movl	$8, 4(%esp)
	leal	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_unregister
	addl	$76, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE16:
	.size	shut_down, .-shut_down
	.section	.rodata
.LC260:
	.string	"too many connections!"
	.align 4
.LC261:
	.string	"thttpd.c:1523:63 (handle_newconnect)"
	.align 4
.LC262:
	.string	"the connects free list is messed up"
	.align 4
.LC263:
	.string	"thttpd.c:1530:8 (handle_newconnect)"
	.align 4
.LC264:
	.string	"thttpd.c:1532:12 (handle_newconnect)"
	.align 4
.LC265:
	.string	"thttpd.c:1533:12 (handle_newconnect)"
	.align 4
.LC266:
	.string	"out of memory allocating an httpd_conn"
	.align 4
.LC267:
	.string	"thttpd.c:1538:7 (handle_newconnect)"
	.align 4
.LC268:
	.string	"thttpd.c:1538:25 (handle_newconnect)"
	.align 4
.LC269:
	.string	"thttpd.c:1543:25 (handle_newconnect)"
	.align 4
.LC270:
	.string	"thttpd.c:1556:16 (handle_newconnect)"
	.align 4
.LC271:
	.string	"thttpd.c:1558:24 (handle_newconnect)"
	.align 4
.LC272:
	.string	"thttpd.c:1559:23 (handle_newconnect)"
	.align 4
.LC273:
	.string	"thttpd.c:1562:20 (handle_newconnect)"
	.align 4
.LC274:
	.string	"thttpd.c:1562:15 (handle_newconnect)"
	.align 4
.LC275:
	.string	"thttpd.c:1563:18 (handle_newconnect)"
	.align 4
.LC276:
	.string	"thttpd.c:1564:18 (handle_newconnect)"
	.align 4
.LC277:
	.string	"thttpd.c:1565:21 (handle_newconnect)"
	.align 4
.LC278:
	.string	"thttpd.c:1566:14 (handle_newconnect)"
	.align 4
.LC279:
	.string	"thttpd.c:1569:21 (handle_newconnect)"
	.align 4
.LC280:
	.string	"thttpd.c:1569:18 (handle_newconnect)"
	.align 4
.LC281:
	.string	"thttpd.c:1571:19 (handle_newconnect)"
	.align 4
.LC282:
	.string	"thttpd.c:1571:16 (handle_newconnect)"
	.text
	.type	handle_newconnect, @function
handle_newconnect:
.LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$76, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
	jmp	.L370
.L373:
	nop
.L370:
	movl	num_connects, %edx
	movl	max_connects, %eax
	cmpl	%eax, %edx
	jl	.L340
	movl	$.LC260, 4(%esp)
	movl	$4, (%esp)
	call	syslog
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	tmr_run
	movl	$0, %eax
	jmp	.L371
.L340:
	movl	first_free_connect, %eax
	cmpl	$-1, %eax
	je	.L342
	movl	connects, %ecx
	movl	first_free_connect, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %edi
	movl	%edi, %edx
	movl	%edi, %eax
	addl	$3, %eax
	movl	%eax, -60(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-49(%ebp)
	movl	4(%ecx), %eax
	cmpl	-60(%ebp), %eax
	setb	%al
	orb	-49(%ebp), %al
	testb	%al, %al
	je	.L343
	movl	-60(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC261, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L343:
	movl	(%edi), %eax
	testl	%eax, %eax
	je	.L344
.L342:
	movl	$.LC262, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L344:
	movl	connects, %ecx
	movl	first_free_connect, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	addl	%ecx, %eax
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	movl	-28(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L345
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC263, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L345:
	movl	-28(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	.L346
	movl	$456, (%esp)
	call	malloc
	movl	%eax, -44(%ebp)
	movl	-28(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	$8, %eax
	leal	3(%eax), %edi
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-50(%ebp)
	movl	4(%ecx), %eax
	cmpl	%edi, %eax
	setb	%al
	orb	-50(%ebp), %al
	testb	%al, %al
	je	.L347
	movl	%edi, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC264, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L347:
	movl	-28(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-28(%ebp), %eax
	movl	-28(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L348
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC265, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L348:
	movl	-28(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	.L349
	movl	$.LC266, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L349:
	movl	-28(%ebp), %eax
	movl	-28(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L350
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC267, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L350:
	movl	-28(%ebp), %eax
	movl	8(%eax), %edi
	movl	%edi, %edx
	movl	%edi, %eax
	addl	$3, %eax
	movl	%eax, -64(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-51(%ebp)
	movl	4(%ecx), %eax
	cmpl	-64(%ebp), %eax
	setb	%al
	orb	-51(%ebp), %al
	testb	%al, %al
	je	.L351
	movl	-64(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC268, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L351:
	movl	$0, (%edi)
	movl	httpd_conn_count, %eax
	addl	$1, %eax
	movl	%eax, httpd_conn_count
.L346:
	movl	-28(%ebp), %eax
	movl	-28(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L352
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC269, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L352:
	movl	-28(%ebp), %eax
	movl	8(%eax), %edx
	movl	hs, %eax
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	httpd_get_conn
	testl	%eax, %eax
	je	.L354
	cmpl	$2, %eax
	je	.L355
	jmp	.L372
.L354:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	tmr_run
	movl	$0, %eax
	jmp	.L371
.L355:
	movl	$1, %eax
	jmp	.L371
.L372:
	movl	-28(%ebp), %eax
	movl	-28(%ebp), %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L356
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC270, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L356:
	movl	-28(%ebp), %eax
	movl	$1, (%eax)
	movl	-28(%ebp), %eax
	movl	-28(%ebp), %edx
	addl	$4, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L357
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC271, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L357:
	movl	-28(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, first_free_connect
	movl	-28(%ebp), %eax
	movl	-28(%ebp), %edx
	addl	$4, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L358
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC272, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L358:
	movl	-28(%ebp), %eax
	movl	$-1, 4(%eax)
	movl	num_connects, %eax
	addl	$1, %eax
	movl	%eax, num_connects
	movl	-28(%ebp), %eax
	movl	%eax, -32(%ebp)
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L359
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC273, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L359:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -48(%ebp)
	movl	-28(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	$68, %eax
	leal	3(%eax), %edi
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-52(%ebp)
	movl	4(%ecx), %eax
	cmpl	%edi, %eax
	setb	%al
	orb	-52(%ebp), %al
	testb	%al, %al
	je	.L360
	movl	%edi, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC274, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L360:
	movl	-28(%ebp), %eax
	movl	-48(%ebp), %edx
	movl	%edx, 68(%eax)
	movl	-28(%ebp), %eax
	movl	-28(%ebp), %edx
	addl	$72, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L361
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC275, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L361:
	movl	-28(%ebp), %eax
	movl	$0, 72(%eax)
	movl	-28(%ebp), %eax
	movl	-28(%ebp), %edx
	addl	$76, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L362
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC276, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L362:
	movl	-28(%ebp), %eax
	movl	$0, 76(%eax)
	movl	-28(%ebp), %eax
	movl	-28(%ebp), %edx
	addl	$92, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L363
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC277, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L363:
	movl	-28(%ebp), %eax
	movl	$0, 92(%eax)
	movl	-28(%ebp), %eax
	movl	-28(%ebp), %edx
	addl	$52, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L364
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC278, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L364:
	movl	-28(%ebp), %eax
	movl	$0, 52(%eax)
	movl	-28(%ebp), %eax
	movl	-28(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L365
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC279, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L365:
	movl	-28(%ebp), %eax
	movl	8(%eax), %edi
	movl	%edi, %edx
	leal	448(%edi), %eax
	addl	$3, %eax
	movl	%eax, -68(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-53(%ebp)
	movl	4(%ecx), %eax
	cmpl	-68(%ebp), %eax
	setb	%al
	orb	-53(%ebp), %al
	testb	%al, %al
	je	.L366
	movl	-68(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC280, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L366:
	movl	448(%edi), %eax
	movl	%eax, (%esp)
	call	httpd_set_ndelay
	movl	-28(%ebp), %eax
	movl	-28(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L367
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC281, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L367:
	movl	-28(%ebp), %eax
	movl	8(%eax), %edi
	movl	%edi, %edx
	leal	448(%edi), %eax
	addl	$3, %eax
	movl	%eax, -72(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-54(%ebp)
	movl	4(%ecx), %eax
	cmpl	-72(%ebp), %eax
	setb	%al
	orb	-54(%ebp), %al
	testb	%al, %al
	je	.L368
	movl	-72(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC282, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L368:
	movl	448(%edi), %eax
	movl	$0, 8(%esp)
	movl	-28(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fdwatch_add_fd
	movl	stats_connections, %eax
	addl	$1, %eax
	movl	%eax, stats_connections
	movl	num_connects, %edx
	movl	stats_simultaneous, %eax
	cmpl	%eax, %edx
	jle	.L373
	movl	num_connects, %eax
	movl	%eax, stats_simultaneous
	jmp	.L373
.L371:
	addl	$76, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE17:
	.size	handle_newconnect, .-handle_newconnect
	.section	.rodata
	.align 4
.LC283:
	.string	"thttpd.c:1585:17 (handle_read)"
	.align 4
.LC284:
	.string	"thttpd.c:1588:12 (handle_read)"
	.align 4
.LC285:
	.string	"thttpd.c:1588:28 (handle_read)"
.LC286:
	.string	"thttpd.c:1590:9 (handle_read)"
	.align 4
.LC287:
	.string	"thttpd.c:1597:39 (handle_read)"
	.align 4
.LC288:
	.string	"thttpd.c:1601:14 (handle_read)"
	.align 4
.LC289:
	.string	"thttpd.c:1602:19 (handle_read)"
	.align 4
.LC290:
	.string	"thttpd.c:1602:29 (handle_read)"
.LC291:
	.string	"thttpd.c:1617:7 (handle_read)"
	.align 4
.LC292:
	.string	"thttpd.c:1617:25 (handle_read)"
	.align 4
.LC293:
	.string	"thttpd.c:1617:44 (handle_read)"
	.align 4
.LC294:
	.string	"thttpd.c:1624:18 (handle_read)"
	.align 4
.LC295:
	.string	"thttpd.c:1625:23 (handle_read)"
	.align 4
.LC296:
	.string	"thttpd.c:1625:18 (handle_read)"
	.align 4
.LC297:
	.string	"thttpd.c:1648:16 (handle_read)"
	.align 4
.LC298:
	.string	"thttpd.c:1663:12 (handle_read)"
	.align 4
.LC299:
	.string	"thttpd.c:1665:25 (handle_read)"
	.align 4
.LC300:
	.string	"thttpd.c:1665:21 (handle_read)"
	.align 4
.LC301:
	.string	"thttpd.c:1666:24 (handle_read)"
	.align 4
.LC302:
	.string	"thttpd.c:1666:20 (handle_read)"
	.align 4
.LC303:
	.string	"thttpd.c:1668:17 (handle_read)"
	.align 4
.LC304:
	.string	"thttpd.c:1669:20 (handle_read)"
	.align 4
.LC305:
	.string	"thttpd.c:1671:24 (handle_read)"
	.align 4
.LC306:
	.string	"thttpd.c:1671:20 (handle_read)"
	.align 4
.LC307:
	.string	"thttpd.c:1674:12 (handle_read)"
	.align 4
.LC308:
	.string	"thttpd.c:1679:24 (handle_read)"
	.align 4
.LC309:
	.string	"thttpd.c:1679:48 (handle_read)"
	.align 4
.LC310:
	.string	"thttpd.c:1679:53 (handle_read)"
	.align 4
.LC311:
	.string	"thttpd.c:1678:26 (handle_read)"
	.align 4
.LC312:
	.string	"thttpd.c:1680:25 (handle_read)"
	.align 4
.LC313:
	.string	"thttpd.c:1680:21 (handle_read)"
	.align 4
.LC314:
	.string	"thttpd.c:1684:11 (handle_read)"
	.align 4
.LC315:
	.string	"thttpd.c:1684:33 (handle_read)"
	.align 4
.LC316:
	.string	"thttpd.c:1692:19 (handle_read)"
	.align 4
.LC317:
	.string	"thttpd.c:1693:24 (handle_read)"
	.align 4
.LC318:
	.string	"thttpd.c:1693:19 (handle_read)"
	.align 4
.LC319:
	.string	"thttpd.c:1694:25 (handle_read)"
	.align 4
.LC320:
	.string	"thttpd.c:1697:19 (handle_read)"
	.align 4
.LC321:
	.string	"thttpd.c:1698:19 (handle_read)"
	.text
	.type	handle_read, @function
handle_read:
.LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$124, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L375
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC283, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L375:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$144, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L376
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC284, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L376:
	movl	-32(%ebp), %eax
	movl	144(%eax), %eax
	movl	%eax, -44(%ebp)
	movl	-32(%ebp), %edx
	movl	-32(%ebp), %eax
	addl	$140, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-100(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	%al
	movl	%eax, %esi
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orl	%esi, %eax
	testb	%al, %al
	je	.L377
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC285, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %edx
	movl	%edx, -100(%ebp)
.L377:
	movl	-32(%ebp), %eax
	movl	140(%eax), %eax
	cmpl	%eax, -44(%ebp)
	jb	.L378
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$140, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L379
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC286, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L379:
	movl	-32(%ebp), %eax
	movl	140(%eax), %eax
	cmpl	$5000, %eax
	jbe	.L380
	movl	httpd_err400form, %edx
	movl	httpd_err400title, %eax
	movl	$.LC96, 20(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC96, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$400, 4(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_send_err
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L374
.L380:
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$140, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L382
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC287, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L382:
	movl	-32(%ebp), %eax
	movl	140(%eax), %eax
	leal	1000(%eax), %ecx
	movl	-32(%ebp), %eax
	leal	140(%eax), %edx
	movl	-32(%ebp), %eax
	addl	$136, %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	httpd_realloc_str
.L378:
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$140, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L383
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC288, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L383:
	movl	-32(%ebp), %eax
	movl	140(%eax), %eax
	movl	%eax, -48(%ebp)
	movl	-32(%ebp), %edx
	movl	-32(%ebp), %eax
	addl	$136, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-100(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	%al
	movl	%eax, %esi
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orl	%esi, %eax
	testb	%al, %al
	je	.L384
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC289, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %edx
	movl	%edx, -100(%ebp)
.L384:
	movl	-32(%ebp), %eax
	movl	136(%eax), %eax
	movl	%eax, -52(%ebp)
	movl	-32(%ebp), %ebx
	movl	-32(%ebp), %eax
	addl	$144, %eax
	leal	3(%eax), %esi
	movl	%ebx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-100(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	%esi, %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L385
	movl	%esi, %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC290, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L385:
	movl	-32(%ebp), %eax
	movl	144(%eax), %eax
	movl	-52(%ebp), %edx
	addl	%eax, %edx
	movl	%edx, -56(%ebp)
	movl	-32(%ebp), %ebx
	movl	-32(%ebp), %eax
	addl	$448, %eax
	leal	3(%eax), %esi
	movl	%ebx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-100(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	%esi, %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L386
	movl	%esi, %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC288, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L386:
	movl	-32(%ebp), %eax
	movl	448(%eax), %eax
	movl	-48(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	-56(%ebp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	call	read
	movl	%eax, -36(%ebp)
	cmpl	$0, -36(%ebp)
	jne	.L387
	movl	httpd_err400form, %edx
	movl	httpd_err400title, %eax
	movl	$.LC96, 20(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC96, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$400, 4(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_send_err
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L374
.L387:
	cmpl	$0, -36(%ebp)
	jns	.L388
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	leal	3(%ebx), %eax
	movl	%eax, %esi
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-100(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-89(%ebp)
	movl	4(%ecx), %eax
	cmpl	%esi, %eax
	setb	%al
	orb	-89(%ebp), %al
	testb	%al, %al
	je	.L389
	movl	%esi, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC291, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L389:
	movl	(%ebx), %eax
	cmpl	$4, %eax
	je	.L374
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	leal	3(%ebx), %eax
	movl	%eax, %esi
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-100(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-90(%ebp)
	movl	4(%ecx), %eax
	cmpl	%esi, %eax
	setb	%al
	orb	-90(%ebp), %al
	testb	%al, %al
	je	.L390
	movl	%esi, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC292, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L390:
	movl	(%ebx), %eax
	cmpl	$11, %eax
	je	.L374
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %eax
	leal	3(%ebx), %edx
	movl	%edx, %esi
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%esi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L391
	movl	%esi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC293, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L391:
	movl	(%ebx), %eax
	cmpl	$11, %eax
	je	.L374
	movl	httpd_err400form, %edx
	movl	httpd_err400title, %eax
	movl	$.LC96, 20(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC96, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$400, 4(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_send_err
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L374
.L388:
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$144, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L392
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC294, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L392:
	movl	-32(%ebp), %eax
	movl	144(%eax), %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -60(%ebp)
	movl	-32(%ebp), %edx
	movl	-32(%ebp), %eax
	addl	$144, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-100(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	%al
	movl	%eax, %esi
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orl	%esi, %eax
	testb	%al, %al
	je	.L393
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC294, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %edx
	movl	%edx, -100(%ebp)
.L393:
	movl	-32(%ebp), %eax
	movl	-60(%ebp), %ecx
	movl	%ecx, 144(%eax)
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L394
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC295, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L394:
	movl	12(%ebp), %eax
	movl	(%eax), %esi
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$68, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-100(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-91(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-91(%ebp), %al
	testb	%al, %al
	je	.L395
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC296, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L395:
	movl	8(%ebp), %eax
	movl	%esi, 68(%eax)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_got_request
	testl	%eax, %eax
	je	.L374
	cmpl	$2, %eax
	jne	.L436
.L397:
	movl	httpd_err400form, %edx
	movl	httpd_err400title, %eax
	movl	$.LC96, 20(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC96, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$400, 4(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_send_err
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L374
.L436:
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_parse_request
	testl	%eax, %eax
	jns	.L398
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L374
.L398:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	check_throttles
	testl	%eax, %eax
	jne	.L399
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$172, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L400
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC297, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L400:
	movl	-32(%ebp), %eax
	movl	172(%eax), %ecx
	movl	httpd_err503form, %edx
	movl	httpd_err503title, %eax
	movl	%ecx, 20(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC96, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$503, 4(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_send_err
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L374
.L399:
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_start_request
	testl	%eax, %eax
	jns	.L401
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L374
.L401:
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$336, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L402
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC298, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L402:
	movl	-32(%ebp), %eax
	movl	336(%eax), %eax
	testl	%eax, %eax
	je	.L403
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$344, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L404
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC299, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L404:
	movl	-32(%ebp), %eax
	movl	344(%eax), %esi
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$92, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-100(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-92(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-92(%ebp), %al
	testb	%al, %al
	je	.L405
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC300, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L405:
	movl	8(%ebp), %eax
	movl	%esi, 92(%eax)
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$348, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L406
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC301, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L406:
	movl	-32(%ebp), %eax
	movl	348(%eax), %eax
	addl	$1, %eax
	movl	%eax, -64(%ebp)
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$88, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-100(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	%al
	movl	%eax, %esi
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orl	%esi, %eax
	testb	%al, %al
	je	.L407
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC302, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %edx
	movl	%edx, -100(%ebp)
.L407:
	movl	8(%ebp), %eax
	movl	-64(%ebp), %ecx
	movl	%ecx, 88(%eax)
	jmp	.L408
.L403:
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$164, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L409
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC303, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L409:
	movl	-32(%ebp), %eax
	movl	164(%eax), %eax
	testl	%eax, %eax
	jns	.L410
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$88, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L411
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC304, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L411:
	movl	8(%ebp), %eax
	movl	$0, 88(%eax)
	jmp	.L408
.L410:
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$164, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L412
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC305, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L412:
	movl	-32(%ebp), %eax
	movl	164(%eax), %esi
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$88, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-100(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-93(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-93(%ebp), %al
	testb	%al, %al
	je	.L413
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC306, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L413:
	movl	8(%ebp), %eax
	movl	%esi, 88(%eax)
.L408:
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$452, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L414
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC307, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L414:
	movl	-32(%ebp), %eax
	movl	452(%eax), %eax
	testl	%eax, %eax
	jne	.L415
	movl	$0, -28(%ebp)
	jmp	.L416
.L423:
	movl	throttles, %edx
	movl	%edx, -68(%ebp)
	movl	8(%ebp), %ebx
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	addl	$12, %eax
	leal	3(%eax), %esi
	movl	%ebx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-100(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	%esi, %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L417
	movl	%esi, %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC308, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L417:
	movl	8(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	-68(%ebp), %edx
	addl	%eax, %edx
	movl	%edx, -72(%ebp)
	movl	throttles, %ecx
	movl	%ecx, -76(%ebp)
	movl	8(%ebp), %ebx
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	addl	$12, %eax
	leal	3(%eax), %esi
	movl	%ebx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-100(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	%esi, %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L418
	movl	%esi, %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC308, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L418:
	movl	8(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	-76(%ebp), %esi
	addl	%eax, %esi
	movl	%esi, %ebx
	leal	16(%esi), %eax
	addl	$3, %eax
	movl	%eax, -104(%ebp)
	movl	%ebx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-100(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-104(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L419
	movl	-104(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC309, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L419:
	movl	16(%esi), %esi
	movl	%esi, -80(%ebp)
	movl	-32(%ebp), %ebx
	movl	-32(%ebp), %eax
	addl	$168, %eax
	leal	3(%eax), %esi
	movl	%ebx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-100(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	%esi, %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L420
	movl	%esi, %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC310, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L420:
	movl	-32(%ebp), %eax
	movl	168(%eax), %eax
	movl	-80(%ebp), %edx
	addl	%eax, %edx
	movl	%edx, -84(%ebp)
	movl	-72(%ebp), %ebx
	movl	-72(%ebp), %eax
	addl	$16, %eax
	leal	3(%eax), %esi
	movl	%ebx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-100(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	%esi, %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L421
	movl	%esi, %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC309, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L421:
	movl	-84(%ebp), %ecx
	movl	-72(%ebp), %edx
	movl	%ecx, 16(%edx)
	addl	$1, -28(%ebp)
.L416:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$52, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L422
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC311, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L422:
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	-28(%ebp), %eax
	jg	.L423
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$168, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L424
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC312, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L424:
	movl	-32(%ebp), %eax
	movl	168(%eax), %esi
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$92, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L425
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC313, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L425:
	movl	8(%ebp), %eax
	movl	%esi, 92(%eax)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L374
.L415:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$92, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L426
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC314, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L426:
	movl	8(%ebp), %eax
	movl	92(%eax), %eax
	movl	%eax, -88(%ebp)
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$88, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-100(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	%al
	movl	%eax, %esi
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orl	%esi, %eax
	testb	%al, %al
	je	.L427
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC315, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %edx
	movl	%edx, -100(%ebp)
.L427:
	movl	8(%ebp), %eax
	movl	88(%eax), %eax
	cmpl	%eax, -88(%ebp)
	jl	.L428
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L374
.L428:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L429
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC316, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L429:
	movl	8(%ebp), %eax
	movl	$2, (%eax)
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L430
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC317, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L430:
	movl	12(%ebp), %eax
	movl	(%eax), %esi
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-100(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-94(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-94(%ebp), %al
	testb	%al, %al
	je	.L431
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC318, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L431:
	movl	8(%ebp), %eax
	movl	%esi, 64(%eax)
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$80, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L432
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC319, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L432:
	movl	8(%ebp), %eax
	movl	$0, 80(%eax)
	movl	8(%ebp), %eax
	movl	%eax, -40(%ebp)
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$448, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L433
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC320, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -100(%ebp)
.L433:
	movl	-32(%ebp), %eax
	movl	448(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$448, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-100(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L434
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC321, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L434:
	movl	-32(%ebp), %eax
	movl	448(%eax), %eax
	movl	$1, 8(%esp)
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fdwatch_add_fd
.L374:
	addl	$124, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE18:
	.size	handle_read, .-handle_read
	.section	.rodata
	.align 4
.LC322:
	.string	"thttpd.c:1709:17 (handle_send)"
	.align 4
.LC323:
	.string	"thttpd.c:1712:11 (handle_send)"
	.align 4
.LC324:
	.string	"thttpd.c:1715:15 (handle_send)"
	.align 4
.LC325:
	.string	"thttpd.c:1718:12 (handle_send)"
.LC326:
	.string	"thttpd.c:1723:6 (handle_send)"
	.align 4
.LC327:
	.string	"thttpd.c:1722:23 (handle_send)"
	.align 4
.LC328:
	.string	"thttpd.c:1722:39 (handle_send)"
	.align 4
.LC329:
	.string	"thttpd.c:1721:12 (handle_send)"
	.align 4
.LC330:
	.string	"thttpd.c:1730:15 (handle_send) iv"
	.align 4
.LC331:
	.string	"thttpd.c:1732:21 (handle_send)"
	.align 4
.LC332:
	.string	"thttpd.c:1732:17 (handle_send)"
	.align 4
.LC333:
	.string	"thttpd.c:1733:20 (handle_send)"
	.align 4
.LC334:
	.string	"thttpd.c:1733:16 (handle_send)"
	.align 4
.LC335:
	.string	"thttpd.c:1734:23 (handle_send)"
	.align 4
.LC336:
	.string	"thttpd.c:1734:39 (handle_send)"
	.align 4
.LC337:
	.string	"thttpd.c:1734:17 (handle_send)"
	.align 4
.LC338:
	.string	"thttpd.c:1735:18 (handle_send)"
	.align 4
.LC339:
	.string	"thttpd.c:1735:16 (handle_send)"
	.align 4
.LC340:
	.string	"thttpd.c:1736:13 (handle_send)"
	.align 4
.LC341:
	.string	"thttpd.c:1739:20 (handle_send)"
	.align 4
.LC342:
	.string	"thttpd.c:1743:17 (handle_send)"
	.align 4
.LC343:
	.string	"thttpd.c:1743:41 (handle_send)"
	.align 4
.LC344:
	.string	"thttpd.c:1755:22 (handle_send)"
	.align 4
.LC345:
	.string	"thttpd.c:1756:16 (handle_send)"
	.align 4
.LC346:
	.string	"thttpd.c:1757:16 (handle_send)"
.LC347:
	.string	"thttpd.c:1759:8 (handle_send)"
	.align 4
.LC348:
	.string	"replacing non-null wakeup_timer!"
	.align 4
.LC349:
	.string	"thttpd.c:1761:30 (handle_send)"
	.align 4
.LC350:
	.string	"thttpd.c:1761:18 (handle_send)"
.LC351:
	.string	"thttpd.c:1763:8 (handle_send)"
	.align 4
.LC352:
	.string	"tmr_create(wakeup_connection) failed"
.LC353:
	.string	"thttpd.c:1784:7 (handle_send)"
	.align 4
.LC354:
	.string	"thttpd.c:1784:25 (handle_send)"
	.align 4
.LC355:
	.string	"thttpd.c:1784:44 (handle_send)"
	.align 4
.LC356:
	.string	"thttpd.c:1785:12 (handle_send)"
.LC357:
	.string	"write - %m sending %.80s"
	.align 4
.LC358:
	.string	"thttpd.c:1791:23 (handle_send)"
	.align 4
.LC359:
	.string	"thttpd.c:1791:18 (handle_send)"
	.align 4
.LC360:
	.string	"thttpd.c:1793:12 (handle_send)"
	.align 4
.LC361:
	.string	"thttpd.c:1796:14 (handle_send)"
	.align 4
.LC362:
	.string	"thttpd.c:1799:21 (handle_send)"
	.align 4
.LC363:
	.string	"thttpd.c:1800:40 (handle_send)"
	.align 4
.LC364:
	.string	"thttpd.c:1800:24 (handle_send)"
	.align 4
.LC365:
	.string	"thttpd.c:1801:22 (handle_send)"
	.align 4
.LC366:
	.string	"thttpd.c:1807:14 (handle_send)"
	.align 4
.LC367:
	.string	"thttpd.c:1808:22 (handle_send)"
	.align 4
.LC368:
	.string	"thttpd.c:1812:24 (handle_send)"
.LC369:
	.string	"thttpd.c:1813:6 (handle_send)"
	.align 4
.LC370:
	.string	"thttpd.c:1813:23 (handle_send)"
	.align 4
.LC371:
	.string	"thttpd.c:1815:20 (handle_send)"
	.align 4
.LC372:
	.string	"thttpd.c:1815:44 (handle_send)"
	.align 4
.LC373:
	.string	"thttpd.c:1814:29 (handle_send)"
	.align 4
.LC374:
	.string	"thttpd.c:1818:11 (handle_send)"
	.align 4
.LC375:
	.string	"thttpd.c:1818:33 (handle_send)"
	.align 4
.LC376:
	.string	"thttpd.c:1826:11 (handle_send)"
	.align 4
.LC377:
	.string	"thttpd.c:1827:22 (handle_send)"
	.align 4
.LC378:
	.string	"thttpd.c:1830:11 (handle_send)"
	.align 4
.LC379:
	.string	"thttpd.c:1832:15 (handle_send)"
	.align 4
.LC380:
	.string	"thttpd.c:1832:27 (handle_send)"
.LC381:
	.string	"thttpd.c:1835:8 (handle_send)"
	.align 4
.LC382:
	.string	"thttpd.c:1835:12 (handle_send)"
	.align 4
.LC383:
	.string	"thttpd.c:1835:38 (handle_send)"
	.align 4
.LC384:
	.string	"thttpd.c:1837:20 (handle_send)"
	.align 4
.LC385:
	.string	"thttpd.c:1838:20 (handle_send)"
	.align 4
.LC386:
	.string	"thttpd.c:1842:15 (handle_send)"
	.align 4
.LC387:
	.string	"thttpd.c:1842:19 (handle_send)"
	.align 4
.LC388:
	.string	"thttpd.c:1842:35 (handle_send)"
	.align 4
.LC389:
	.string	"thttpd.c:1844:12 (handle_send)"
	.align 4
.LC390:
	.string	"thttpd.c:1846:22 (handle_send)"
	.align 4
.LC391:
	.string	"thttpd.c:1849:12 (handle_send)"
	.text
	.type	handle_send, @function
handle_send:
.LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$332, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L438
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC322, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L438:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -44(%ebp)
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$56, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L439
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC323, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L439:
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	$-1, %eax
	jne	.L440
	movl	$1000000000, -28(%ebp)
	jmp	.L441
.L440:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$56, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L442
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC324, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L442:
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	leal	3(%eax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$2, %eax
	movl	%eax, -28(%ebp)
.L441:
	movl	-44(%ebp), %eax
	movl	-44(%ebp), %edx
	addl	$304, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L443
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC325, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L443:
	movl	-44(%ebp), %eax
	movl	304(%eax), %eax
	testl	%eax, %eax
	jne	.L444
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$88, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L445
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC326, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L445:
	movl	8(%ebp), %eax
	movl	88(%eax), %eax
	movl	%eax, -76(%ebp)
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$92, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-197(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-197(%ebp), %al
	testb	%al, %al
	je	.L446
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC326, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L446:
	movl	8(%ebp), %eax
	movl	92(%eax), %eax
	movl	-76(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	movl	-28(%ebp), %eax
	cmpl	%eax, %edx
	movl	%eax, %ecx
	cmovbe	%edx, %ecx
	movl	%ecx, -80(%ebp)
	movl	-44(%ebp), %edx
	movl	-44(%ebp), %eax
	addl	$452, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-198(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-198(%ebp), %al
	testb	%al, %al
	je	.L447
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC327, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L447:
	movl	-44(%ebp), %eax
	movl	452(%eax), %eax
	movl	%eax, -84(%ebp)
	movl	8(%ebp), %ebx
	movl	8(%ebp), %eax
	addl	$92, %eax
	addl	$3, %eax
	movl	%eax, -232(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-232(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L448
	movl	-232(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC328, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L448:
	movl	8(%ebp), %eax
	movl	92(%eax), %eax
	movl	-84(%ebp), %edx
	addl	%eax, %edx
	movl	%edx, -88(%ebp)
	movl	-44(%ebp), %ebx
	movl	-44(%ebp), %eax
	addl	$448, %eax
	addl	$3, %eax
	movl	%eax, -236(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-236(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L449
	movl	-236(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC329, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L449:
	movl	-44(%ebp), %eax
	movl	448(%eax), %eax
	movl	-80(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	-88(%ebp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	call	write
	movl	%eax, -32(%ebp)
	jmp	.L450
.L444:
	movl	$.LC330, 12(%esp)
	movl	$3, 8(%esp)
	movl	$16, 4(%esp)
	leal	-72(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_register
	movl	-44(%ebp), %eax
	movl	-44(%ebp), %edx
	addl	$252, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L451
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC331, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L451:
	movl	-44(%ebp), %eax
	movl	252(%eax), %eax
	movl	%eax, -92(%ebp)
	leal	-72(%ebp), %edx
	leal	-72(%ebp), %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-199(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-199(%ebp), %al
	testb	%al, %al
	je	.L452
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC332, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L452:
	movl	-92(%ebp), %eax
	movl	%eax, -72(%ebp)
	movl	-44(%ebp), %eax
	movl	-44(%ebp), %edx
	addl	$304, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L453
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC333, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L453:
	movl	-44(%ebp), %eax
	movl	304(%eax), %eax
	movl	%eax, -96(%ebp)
	leal	-72(%ebp), %edx
	leal	-72(%ebp), %eax
	addl	$4, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-200(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-200(%ebp), %al
	testb	%al, %al
	je	.L454
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC334, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L454:
	movl	-96(%ebp), %eax
	movl	%eax, -68(%ebp)
	movl	-44(%ebp), %eax
	movl	-44(%ebp), %edx
	addl	$452, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L455
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC335, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L455:
	movl	-44(%ebp), %eax
	movl	452(%eax), %eax
	movl	%eax, -100(%ebp)
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$92, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-201(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-201(%ebp), %al
	testb	%al, %al
	je	.L456
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC336, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L456:
	movl	8(%ebp), %eax
	movl	92(%eax), %eax
	movl	-100(%ebp), %edx
	addl	%eax, %edx
	movl	%edx, -104(%ebp)
	leal	-72(%ebp), %edx
	leal	-72(%ebp), %eax
	addl	$8, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-202(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-202(%ebp), %al
	testb	%al, %al
	je	.L457
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC337, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L457:
	movl	-104(%ebp), %eax
	movl	%eax, -64(%ebp)
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$88, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L458
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC338, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L458:
	movl	8(%ebp), %eax
	movl	88(%eax), %eax
	movl	%eax, -108(%ebp)
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$92, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-203(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-203(%ebp), %al
	testb	%al, %al
	je	.L459
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC338, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L459:
	movl	8(%ebp), %eax
	movl	92(%eax), %eax
	movl	-108(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	movl	-28(%ebp), %eax
	cmpl	%eax, %edx
	movl	%eax, %ecx
	cmovbe	%edx, %ecx
	movl	%ecx, -112(%ebp)
	leal	-72(%ebp), %edx
	leal	-72(%ebp), %eax
	addl	$12, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-204(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-204(%ebp), %al
	testb	%al, %al
	je	.L460
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC339, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L460:
	movl	-112(%ebp), %eax
	movl	%eax, -60(%ebp)
	movl	-44(%ebp), %eax
	movl	-44(%ebp), %edx
	addl	$448, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L461
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC340, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L461:
	movl	-44(%ebp), %eax
	movl	448(%eax), %eax
	movl	$2, 8(%esp)
	leal	-72(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	writev
	movl	%eax, -32(%ebp)
	movl	$3, 8(%esp)
	movl	$16, 4(%esp)
	leal	-72(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_unregister
.L450:
	cmpl	$0, -32(%ebp)
	jns	.L462
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	leal	3(%ebx), %eax
	movl	%eax, -240(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-205(%ebp)
	movl	4(%ecx), %eax
	cmpl	-240(%ebp), %eax
	setb	%al
	orb	-205(%ebp), %al
	testb	%al, %al
	je	.L463
	movl	-240(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC341, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L463:
	movl	(%ebx), %eax
	cmpl	$4, %eax
	je	.L437
.L462:
	cmpl	$0, -32(%ebp)
	je	.L465
	cmpl	$0, -32(%ebp)
	jns	.L466
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	leal	3(%ebx), %eax
	movl	%eax, -244(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-206(%ebp)
	movl	4(%ecx), %eax
	cmpl	-244(%ebp), %eax
	setb	%al
	orb	-206(%ebp), %al
	testb	%al, %al
	je	.L467
	movl	-244(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC342, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L467:
	movl	(%ebx), %eax
	cmpl	$11, %eax
	je	.L465
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	leal	3(%ebx), %eax
	movl	%eax, -248(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-207(%ebp)
	movl	4(%ecx), %eax
	cmpl	-248(%ebp), %eax
	setb	%al
	orb	-207(%ebp), %al
	testb	%al, %al
	je	.L468
	movl	-248(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC343, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L468:
	movl	(%ebx), %eax
	cmpl	$11, %eax
	jne	.L466
.L465:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$80, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L469
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC344, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L469:
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	addl	$100, %eax
	movl	%eax, -196(%ebp)
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$80, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-208(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-208(%ebp), %al
	testb	%al, %al
	je	.L470
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC344, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L470:
	movl	8(%ebp), %eax
	movl	-196(%ebp), %edx
	movl	%edx, 80(%eax)
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L471
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC345, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L471:
	movl	8(%ebp), %eax
	movl	$3, (%eax)
	movl	-44(%ebp), %eax
	movl	-44(%ebp), %edx
	addl	$448, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L472
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC346, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L472:
	movl	-44(%ebp), %eax
	movl	448(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
	movl	8(%ebp), %eax
	movl	%eax, -56(%ebp)
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$72, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L473
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC347, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L473:
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	je	.L474
	movl	$.LC348, 4(%esp)
	movl	$3, (%esp)
	call	syslog
.L474:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$80, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L475
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC349, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L475:
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	movl	$0, 16(%esp)
	movl	%eax, 12(%esp)
	movl	-56(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$wakeup_connection, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	tmr_create
	movl	%eax, %ebx
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$72, %eax
	addl	$3, %eax
	movl	%eax, -304(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-209(%ebp)
	movl	4(%ecx), %eax
	cmpl	-304(%ebp), %eax
	setb	%al
	orb	-209(%ebp), %al
	testb	%al, %al
	je	.L476
	movl	-304(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC350, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L476:
	movl	8(%ebp), %eax
	movl	%ebx, 72(%eax)
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$72, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L477
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC351, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L477:
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	jne	.L437
	movl	$.LC352, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L466:
	cmpl	$0, -32(%ebp)
	jns	.L478
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	leal	3(%ebx), %eax
	movl	%eax, -252(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-210(%ebp)
	movl	4(%ecx), %eax
	cmpl	-252(%ebp), %eax
	setb	%al
	orb	-210(%ebp), %al
	testb	%al, %al
	je	.L479
	movl	-252(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC353, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L479:
	movl	(%ebx), %eax
	cmpl	$32, %eax
	je	.L480
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	leal	3(%ebx), %eax
	movl	%eax, -256(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-211(%ebp)
	movl	4(%ecx), %eax
	cmpl	-256(%ebp), %eax
	setb	%al
	orb	-211(%ebp), %al
	testb	%al, %al
	je	.L481
	movl	-256(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC354, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L481:
	movl	(%ebx), %eax
	cmpl	$22, %eax
	je	.L480
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	leal	3(%ebx), %eax
	movl	%eax, -260(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-212(%ebp)
	movl	4(%ecx), %eax
	cmpl	-260(%ebp), %eax
	setb	%al
	orb	-212(%ebp), %al
	testb	%al, %al
	je	.L482
	movl	-260(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC355, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L482:
	movl	(%ebx), %eax
	cmpl	$104, %eax
	je	.L480
	movl	-44(%ebp), %eax
	movl	-44(%ebp), %edx
	addl	$172, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L483
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC356, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L483:
	movl	-44(%ebp), %eax
	movl	172(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$.LC357, 4(%esp)
	movl	$3, (%esp)
	call	syslog
.L480:
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	clear_connection
	jmp	.L437
.L478:
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L484
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC358, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L484:
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -116(%ebp)
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$68, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-213(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-213(%ebp), %al
	testb	%al, %al
	je	.L485
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC359, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L485:
	movl	8(%ebp), %eax
	movl	-116(%ebp), %edx
	movl	%edx, 68(%eax)
	movl	-44(%ebp), %eax
	movl	-44(%ebp), %edx
	addl	$304, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L486
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC360, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L486:
	movl	-44(%ebp), %eax
	movl	304(%eax), %eax
	testl	%eax, %eax
	je	.L487
	movl	-32(%ebp), %eax
	movl	%eax, -120(%ebp)
	movl	-44(%ebp), %edx
	movl	-44(%ebp), %eax
	addl	$304, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-214(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-214(%ebp), %al
	testb	%al, %al
	je	.L488
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC361, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L488:
	movl	-44(%ebp), %eax
	movl	304(%eax), %eax
	cmpl	%eax, -120(%ebp)
	jae	.L489
	movl	-44(%ebp), %eax
	movl	-44(%ebp), %edx
	addl	$304, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L490
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC362, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L490:
	movl	-44(%ebp), %eax
	movl	304(%eax), %edx
	movl	-32(%ebp), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -48(%ebp)
	movl	-48(%ebp), %eax
	movl	%eax, -124(%ebp)
	movl	-44(%ebp), %edx
	movl	-44(%ebp), %eax
	addl	$252, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-215(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-215(%ebp), %al
	testb	%al, %al
	je	.L491
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC363, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L491:
	movl	-44(%ebp), %eax
	movl	252(%eax), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -128(%ebp)
	movl	-44(%ebp), %ebx
	movl	-44(%ebp), %eax
	addl	$252, %eax
	addl	$3, %eax
	movl	%eax, -264(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-264(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L492
	movl	-264(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC364, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L492:
	movl	-44(%ebp), %eax
	movl	252(%eax), %eax
	movl	-124(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	-128(%ebp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	call	__mfwrap_memmove
	movl	-48(%ebp), %eax
	movl	%eax, -132(%ebp)
	movl	-44(%ebp), %edx
	movl	-44(%ebp), %eax
	addl	$304, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-216(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-216(%ebp), %al
	testb	%al, %al
	je	.L493
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC365, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L493:
	movl	-44(%ebp), %eax
	movl	-132(%ebp), %edx
	movl	%edx, 304(%eax)
	movl	$0, -32(%ebp)
	jmp	.L487
.L489:
	movl	-32(%ebp), %ecx
	movl	%ecx, -136(%ebp)
	movl	-44(%ebp), %edx
	movl	-44(%ebp), %eax
	addl	$304, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-217(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-217(%ebp), %al
	testb	%al, %al
	je	.L494
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC366, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L494:
	movl	-44(%ebp), %eax
	movl	304(%eax), %eax
	movl	-136(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -32(%ebp)
	movl	-44(%ebp), %eax
	movl	-44(%ebp), %edx
	addl	$304, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L495
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC367, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L495:
	movl	-44(%ebp), %eax
	movl	$0, 304(%eax)
.L487:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$92, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L496
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC368, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L496:
	movl	8(%ebp), %eax
	movl	92(%eax), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -140(%ebp)
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$92, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-218(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-218(%ebp), %al
	testb	%al, %al
	je	.L497
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC368, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L497:
	movl	8(%ebp), %eax
	movl	-140(%ebp), %edx
	movl	%edx, 92(%eax)
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L498
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC369, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L498:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -144(%ebp)
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$8, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-219(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-219(%ebp), %al
	testb	%al, %al
	je	.L499
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC369, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L499:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -148(%ebp)
	movl	-148(%ebp), %ebx
	movl	-148(%ebp), %eax
	addl	$168, %eax
	addl	$3, %eax
	movl	%eax, -268(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-268(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L500
	movl	-268(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC370, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L500:
	movl	-148(%ebp), %eax
	movl	168(%eax), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -152(%ebp)
	movl	-144(%ebp), %ebx
	movl	-144(%ebp), %eax
	addl	$168, %eax
	addl	$3, %eax
	movl	%eax, -272(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-272(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L501
	movl	-272(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC370, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L501:
	movl	-152(%ebp), %edx
	movl	-144(%ebp), %eax
	movl	%edx, 168(%eax)
	movl	$0, -40(%ebp)
	jmp	.L502
.L508:
	movl	throttles, %ecx
	movl	%ecx, -156(%ebp)
	movl	8(%ebp), %ebx
	movl	-40(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	addl	$12, %eax
	addl	$3, %eax
	movl	%eax, -288(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-288(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L503
	movl	-288(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC371, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L503:
	movl	8(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	-156(%ebp), %edx
	addl	%eax, %edx
	movl	%edx, -160(%ebp)
	movl	throttles, %ecx
	movl	%ecx, -164(%ebp)
	movl	8(%ebp), %ebx
	movl	-40(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	addl	$12, %eax
	addl	$3, %eax
	movl	%eax, -292(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-292(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L504
	movl	-292(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC371, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L504:
	movl	8(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	-164(%ebp), %edx
	addl	%eax, %edx
	movl	%edx, -168(%ebp)
	movl	-168(%ebp), %ebx
	movl	-168(%ebp), %eax
	addl	$16, %eax
	addl	$3, %eax
	movl	%eax, -296(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-296(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L505
	movl	-296(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC372, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L505:
	movl	-168(%ebp), %eax
	movl	16(%eax), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -172(%ebp)
	movl	-160(%ebp), %ebx
	movl	-160(%ebp), %eax
	addl	$16, %eax
	addl	$3, %eax
	movl	%eax, -300(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-300(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L506
	movl	-300(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC372, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L506:
	movl	-172(%ebp), %edx
	movl	-160(%ebp), %eax
	movl	%edx, 16(%eax)
	addl	$1, -40(%ebp)
.L502:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$52, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L507
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC373, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L507:
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	-40(%ebp), %eax
	jg	.L508
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$92, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L509
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC374, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L509:
	movl	8(%ebp), %eax
	movl	92(%eax), %eax
	movl	%eax, -176(%ebp)
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$88, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-220(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-220(%ebp), %al
	testb	%al, %al
	je	.L510
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC375, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L510:
	movl	8(%ebp), %eax
	movl	88(%eax), %eax
	cmpl	%eax, -176(%ebp)
	jl	.L511
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L437
.L511:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$80, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L512
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC376, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L512:
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	cmpl	$100, %eax
	jle	.L513
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$80, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L514
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC377, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L514:
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	subl	$100, %eax
	movl	%eax, -180(%ebp)
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$80, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-221(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-221(%ebp), %al
	testb	%al, %al
	je	.L515
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC377, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L515:
	movl	8(%ebp), %eax
	movl	-180(%ebp), %edx
	movl	%edx, 80(%eax)
.L513:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$56, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L516
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC378, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L516:
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	$-1, %eax
	je	.L437
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L518
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC379, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L518:
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -184(%ebp)
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-222(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-222(%ebp), %al
	testb	%al, %al
	je	.L519
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC380, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L519:
	movl	8(%ebp), %eax
	movl	64(%eax), %eax
	movl	-184(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -36(%ebp)
	cmpl	$0, -36(%ebp)
	jne	.L520
	movl	$1, -36(%ebp)
.L520:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L521
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC381, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L521:
	movl	8(%ebp), %eax
	movl	8(%eax), %ebx
	movl	%ebx, %edx
	leal	168(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -276(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-223(%ebp)
	movl	4(%ecx), %eax
	cmpl	-276(%ebp), %eax
	setb	%al
	orb	-223(%ebp), %al
	testb	%al, %al
	je	.L522
	movl	-276(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC382, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L522:
	movl	168(%ebx), %eax
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	-36(%ebp)
	movl	%eax, -188(%ebp)
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$56, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-224(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-224(%ebp), %al
	testb	%al, %al
	je	.L523
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC383, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L523:
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	%eax, -188(%ebp)
	jle	.L437
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L524
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC384, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L524:
	movl	8(%ebp), %eax
	movl	$3, (%eax)
	movl	-44(%ebp), %eax
	movl	-44(%ebp), %edx
	addl	$448, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L525
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC385, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L525:
	movl	-44(%ebp), %eax
	movl	448(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L526
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC386, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L526:
	movl	8(%ebp), %eax
	movl	8(%eax), %ebx
	movl	%ebx, %edx
	leal	168(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -280(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-225(%ebp)
	movl	4(%ecx), %eax
	cmpl	-280(%ebp), %eax
	setb	%al
	orb	-225(%ebp), %al
	testb	%al, %al
	je	.L527
	movl	-280(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC387, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L527:
	movl	168(%ebx), %ebx
	movl	%ebx, -192(%ebp)
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$56, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-226(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-226(%ebp), %al
	testb	%al, %al
	je	.L528
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC388, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L528:
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	movl	%eax, -308(%ebp)
	movl	-192(%ebp), %eax
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	-308(%ebp)
	subl	-36(%ebp), %eax
	movl	%eax, -52(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, -56(%ebp)
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$72, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L529
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC389, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L529:
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	je	.L530
	movl	$.LC348, 4(%esp)
	movl	$3, (%esp)
	call	syslog
.L530:
	cmpl	$0, -52(%ebp)
	jle	.L531
	movl	-52(%ebp), %eax
	imull	$1000, %eax, %eax
	jmp	.L532
.L531:
	movl	$500, %eax
.L532:
	movl	$0, 16(%esp)
	movl	%eax, 12(%esp)
	movl	-56(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$wakeup_connection, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	tmr_create
	movl	%eax, %ebx
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$72, %eax
	addl	$3, %eax
	movl	%eax, -284(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-227(%ebp)
	movl	4(%ecx), %eax
	cmpl	-284(%ebp), %eax
	setb	%al
	orb	-227(%ebp), %al
	testb	%al, %al
	je	.L533
	movl	-284(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC390, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L533:
	movl	8(%ebp), %eax
	movl	%ebx, 72(%eax)
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$72, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L534
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC391, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L534:
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	jne	.L437
	movl	$.LC352, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L437:
	addl	$332, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE19:
	.size	handle_send, .-handle_send
	.section	.rodata
	.align 4
.LC392:
	.string	"thttpd.c:1863:10 (handle_linger) buf"
	.align 4
.LC393:
	.string	"thttpd.c:1869:16 (handle_linger)"
	.align 4
.LC394:
	.string	"thttpd.c:1869:13 (handle_linger)"
	.align 4
.LC395:
	.string	"thttpd.c:1870:21 (handle_linger)"
	.align 4
.LC396:
	.string	"thttpd.c:1870:39 (handle_linger)"
	.text
	.type	handle_linger, @function
handle_linger:
.LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$4156, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -4144(%ebp)
	movl	$.LC392, 12(%esp)
	movl	$3, 8(%esp)
	movl	$4096, 4(%esp)
	leal	-4124(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_register
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-4144(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L537
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC393, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -4144(%ebp)
.L537:
	movl	8(%ebp), %eax
	movl	8(%eax), %ebx
	movl	%ebx, %edx
	leal	448(%ebx), %eax
	leal	3(%eax), %esi
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-4144(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-4137(%ebp)
	movl	4(%ecx), %eax
	cmpl	%esi, %eax
	setb	%al
	orb	-4137(%ebp), %al
	testb	%al, %al
	je	.L538
	movl	%esi, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC394, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -4144(%ebp)
.L538:
	movl	448(%ebx), %eax
	movl	$4096, 8(%esp)
	leal	-4124(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	read
	movl	%eax, -28(%ebp)
	cmpl	$0, -28(%ebp)
	jns	.L539
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %edx
	leal	3(%ebx), %eax
	movl	%eax, %esi
	movl	%edx, %eax
	movl	%edi, %ecx
	shrl	%cl, %eax
	andl	-4144(%ebp), %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-4138(%ebp)
	movl	4(%ecx), %eax
	cmpl	%esi, %eax
	setb	%al
	orb	-4138(%ebp), %al
	testb	%al, %al
	je	.L540
	movl	%esi, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC395, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %edi
	movl	__mf_lc_mask, %eax
	movl	%eax, -4144(%ebp)
.L540:
	movl	(%ebx), %eax
	cmpl	$4, %eax
	je	.L544
	call	__errno_location
	movl	%eax, %ebx
	movl	%ebx, %eax
	leal	3(%ebx), %edx
	movl	%edx, %esi
	movl	%eax, %edx
	movl	%edi, %ecx
	shrl	%cl, %edx
	andl	-4144(%ebp), %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%esi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L542
	movl	%esi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC396, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L542:
	movl	(%ebx), %eax
	cmpl	$11, %eax
	je	.L544
.L539:
	cmpl	$0, -28(%ebp)
	jg	.L544
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	really_clear_connection
.L544:
	movl	$3, 8(%esp)
	movl	$4096, 4(%esp)
	leal	-4124(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_unregister
	addl	$4156, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	handle_linger, .-handle_linger
	.section	.rodata
	.align 4
.LC397:
	.string	"thttpd.c:1883:17 (check_throttles)"
	.align 4
.LC398:
	.string	"thttpd.c:1884:33 (check_throttles)"
	.align 4
.LC399:
	.string	"thttpd.c:1884:21 (check_throttles)"
	.align 4
.LC400:
	.string	"thttpd.c:1884:18 (check_throttles)"
	.align 4
.LC401:
	.string	"thttpd.c:1887:40 (check_throttles)"
	.align 4
.LC402:
	.string	"thttpd.c:1887:44 (check_throttles)"
	.align 4
.LC403:
	.string	"thttpd.c:1887:29 (check_throttles)"
	.align 4
.LC404:
	.string	"thttpd.c:1890:26 (check_throttles)"
	.align 4
.LC405:
	.string	"thttpd.c:1890:49 (check_throttles)"
	.align 4
.LC406:
	.string	"thttpd.c:1893:26 (check_throttles)"
	.align 4
.LC407:
	.string	"thttpd.c:1893:49 (check_throttles)"
	.align 4
.LC408:
	.string	"thttpd.c:1895:26 (check_throttles)"
	.align 4
.LC409:
	.string	"throttle sending count was negative - shouldn't happen!"
	.align 4
.LC410:
	.string	"thttpd.c:1898:31 (check_throttles)"
	.align 4
.LC411:
	.string	"thttpd.c:1900:16 (check_throttles)"
	.align 4
.LC412:
	.string	"thttpd.c:1900:30 (check_throttles)"
	.align 4
.LC413:
	.string	"thttpd.c:1900:26 (check_throttles)"
	.align 4
.LC414:
	.string	"thttpd.c:1901:23 (check_throttles)"
	.align 4
.LC415:
	.string	"thttpd.c:1901:6 (check_throttles)"
	.align 4
.LC416:
	.string	"thttpd.c:1902:25 (check_throttles)"
	.align 4
.LC417:
	.string	"thttpd.c:1902:53 (check_throttles)"
	.align 4
.LC418:
	.string	"thttpd.c:1903:12 (check_throttles)"
	.align 4
.LC419:
	.string	"thttpd.c:1904:16 (check_throttles)"
	.align 4
.LC420:
	.string	"thttpd.c:1906:18 (check_throttles)"
	.align 4
.LC421:
	.string	"thttpd.c:1906:16 (check_throttles)"
	.align 4
.LC422:
	.string	"thttpd.c:1907:8 (check_throttles)"
	.align 4
.LC423:
	.string	"thttpd.c:1908:12 (check_throttles)"
	.align 4
.LC424:
	.string	"thttpd.c:1909:16 (check_throttles)"
	.align 4
.LC425:
	.string	"thttpd.c:1911:18 (check_throttles)"
	.align 4
.LC426:
	.string	"thttpd.c:1911:16 (check_throttles)"
	.align 4
.LC427:
	.string	"thttpd.c:1885:45 (check_throttles)"
	.text
	.type	check_throttles, @function
check_throttles:
.LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$188, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$52, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L547
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC397, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L547:
	movl	8(%ebp), %eax
	movl	$0, 52(%eax)
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$60, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L548
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC398, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L548:
	movl	8(%ebp), %eax
	movl	$-1, 60(%eax)
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$60, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L549
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC399, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L549:
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	movl	%eax, -44(%ebp)
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$56, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-97(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-97(%ebp), %al
	testb	%al, %al
	je	.L550
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC400, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L550:
	movl	8(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	%edx, 56(%eax)
	movl	$0, -28(%ebp)
	jmp	.L551
.L587:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L552
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC401, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L552:
	movl	8(%ebp), %eax
	movl	8(%eax), %ebx
	movl	%ebx, %edx
	leal	188(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -112(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-98(%ebp)
	movl	4(%ecx), %eax
	cmpl	-112(%ebp), %eax
	setb	%al
	orb	-98(%ebp), %al
	testb	%al, %al
	je	.L553
	movl	-112(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC402, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L553:
	movl	188(%ebx), %ebx
	movl	%ebx, -48(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -52(%ebp)
	movl	-52(%ebp), %ebx
	movl	-52(%ebp), %eax
	addl	$3, %eax
	movl	%eax, -116(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-116(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L554
	movl	-116(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC403, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L554:
	movl	-52(%ebp), %edx
	movl	(%edx), %eax
	movl	-48(%ebp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	call	match
	testl	%eax, %eax
	je	.L555
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	12(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -120(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-99(%ebp)
	movl	4(%ecx), %eax
	cmpl	-120(%ebp), %eax
	setb	%al
	orb	-99(%ebp), %al
	testb	%al, %al
	je	.L556
	movl	-120(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC404, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L556:
	movl	12(%ebx), %ebx
	movl	%ebx, -56(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -60(%ebp)
	movl	-60(%ebp), %ebx
	movl	-60(%ebp), %eax
	addl	$4, %eax
	addl	$3, %eax
	movl	%eax, -124(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-124(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L557
	movl	-124(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC405, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L557:
	movl	-60(%ebp), %edx
	movl	4(%edx), %eax
	addl	%eax, %eax
	cmpl	%eax, -56(%ebp)
	jle	.L558
	movl	$0, %eax
	jmp	.L559
.L558:
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	12(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -128(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-100(%ebp)
	movl	4(%ecx), %eax
	cmpl	-128(%ebp), %eax
	setb	%al
	orb	-100(%ebp), %al
	testb	%al, %al
	je	.L560
	movl	-128(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC406, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L560:
	movl	12(%ebx), %ebx
	movl	%ebx, -64(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -68(%ebp)
	movl	-68(%ebp), %ebx
	movl	-68(%ebp), %eax
	addl	$8, %eax
	addl	$3, %eax
	movl	%eax, -132(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-132(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L561
	movl	-132(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC407, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L561:
	movl	-68(%ebp), %edx
	movl	8(%edx), %eax
	cmpl	%eax, -64(%ebp)
	jge	.L562
	movl	$0, %eax
	jmp	.L559
.L562:
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	20(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -136(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-101(%ebp)
	movl	4(%ecx), %eax
	cmpl	-136(%ebp), %eax
	setb	%al
	orb	-101(%ebp), %al
	testb	%al, %al
	je	.L563
	movl	-136(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC408, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L563:
	movl	20(%ebx), %eax
	testl	%eax, %eax
	jns	.L564
	movl	$.LC409, 4(%esp)
	movl	$3, (%esp)
	call	syslog
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	20(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -140(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-102(%ebp)
	movl	4(%ecx), %eax
	cmpl	-140(%ebp), %eax
	setb	%al
	orb	-102(%ebp), %al
	testb	%al, %al
	je	.L565
	movl	-140(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC410, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L565:
	movl	$0, 20(%ebx)
.L564:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$52, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L566
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC411, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L566:
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	movl	%eax, -72(%ebp)
	movl	8(%ebp), %ebx
	movl	-72(%ebp), %edx
	sall	$2, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	addl	$12, %eax
	addl	$3, %eax
	movl	%eax, -144(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-144(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L567
	movl	-144(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC412, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L567:
	movl	8(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	-72(%ebp), %ecx
	movl	%edx, 12(%eax,%ecx,4)
	movl	-72(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -76(%ebp)
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$52, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-103(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-103(%ebp), %al
	testb	%al, %al
	je	.L568
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC413, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L568:
	movl	8(%ebp), %eax
	movl	-76(%ebp), %edx
	movl	%edx, 52(%eax)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	20(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -148(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-104(%ebp)
	movl	4(%ecx), %eax
	cmpl	-148(%ebp), %eax
	setb	%al
	orb	-104(%ebp), %al
	testb	%al, %al
	je	.L569
	movl	-148(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC414, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L569:
	movl	20(%ebx), %eax
	addl	$1, %eax
	movl	%eax, -80(%ebp)
	movl	%ebx, -152(%ebp)
	leal	20(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -156(%ebp)
	movl	-152(%ebp), %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	-152(%ebp), %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-156(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L570
	movl	-156(%ebp), %eax
	subl	-152(%ebp), %eax
	addl	$1, %eax
	movl	$.LC415, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-152(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L570:
	movl	-80(%ebp), %edx
	movl	%edx, 20(%ebx)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	4(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -160(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-105(%ebp)
	movl	4(%ecx), %eax
	cmpl	-160(%ebp), %eax
	setb	%al
	orb	-105(%ebp), %al
	testb	%al, %al
	je	.L571
	movl	-160(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC416, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L571:
	movl	4(%ebx), %ebx
	movl	%ebx, -84(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -88(%ebp)
	movl	-88(%ebp), %ebx
	movl	-88(%ebp), %eax
	addl	$20, %eax
	addl	$3, %eax
	movl	%eax, -164(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-164(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L572
	movl	-164(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC417, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L572:
	movl	-88(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, -172(%ebp)
	movl	-84(%ebp), %eax
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	-172(%ebp)
	movl	%eax, -32(%ebp)
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$56, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L573
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC418, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L573:
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	$-1, %eax
	jne	.L574
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$56, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L575
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC419, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L575:
	movl	8(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	%edx, 56(%eax)
	jmp	.L576
.L574:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$56, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L577
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC420, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L577:
	movl	8(%ebp), %eax
	movl	56(%eax), %edx
	movl	-32(%ebp), %eax
	cmpl	%eax, %edx
	movl	%eax, %ecx
	cmovle	%edx, %ecx
	movl	%ecx, -92(%ebp)
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$56, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-106(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-106(%ebp), %al
	testb	%al, %al
	je	.L578
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC421, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L578:
	movl	8(%ebp), %eax
	movl	-92(%ebp), %edx
	movl	%edx, 56(%eax)
.L576:
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	8(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -168(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-107(%ebp)
	movl	4(%ecx), %eax
	cmpl	-168(%ebp), %eax
	setb	%al
	orb	-107(%ebp), %al
	testb	%al, %al
	je	.L579
	movl	-168(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC422, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L579:
	movl	8(%ebx), %eax
	movl	%eax, -32(%ebp)
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$60, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L580
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC423, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L580:
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$-1, %eax
	jne	.L581
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$60, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L582
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC424, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L582:
	movl	8(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	%edx, 60(%eax)
	jmp	.L555
.L581:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$60, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L583
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC425, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L583:
	movl	8(%ebp), %eax
	movl	60(%eax), %edx
	movl	-32(%ebp), %eax
	cmpl	%eax, %edx
	movl	%eax, %ecx
	cmovge	%edx, %ecx
	movl	%ecx, -96(%ebp)
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$60, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-108(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-108(%ebp), %al
	testb	%al, %al
	je	.L584
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC426, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L584:
	movl	8(%ebp), %eax
	movl	-96(%ebp), %edx
	movl	%edx, 60(%eax)
.L555:
	addl	$1, -28(%ebp)
.L551:
	movl	numthrottles, %eax
	cmpl	%eax, -28(%ebp)
	jge	.L585
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$52, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L586
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC427, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L586:
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	$9, %eax
	jle	.L587
.L585:
	movl	$1, %eax
.L559:
	addl	$188, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE21:
	.size	check_throttles, .-check_throttles
	.section	.rodata
	.align 4
.LC428:
	.string	"thttpd.c:1923:22 (clear_throttles)"
	.align 4
.LC429:
	.string	"thttpd.c:1923:29 (clear_throttles)"
	.align 4
.LC430:
	.string	"thttpd.c:1923:2 (clear_throttles)"
	.align 4
.LC431:
	.string	"thttpd.c:1922:29 (clear_throttles)"
	.text
	.type	clear_throttles, @function
clear_throttles:
.LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$76, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
	movl	$0, -28(%ebp)
	jmp	.L589
.L594:
	movl	throttles, %eax
	movl	%eax, -44(%ebp)
	movl	8(%ebp), %ebx
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	addl	$12, %eax
	addl	$3, %eax
	movl	%eax, -56(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-56(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L590
	movl	-56(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC428, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L590:
	movl	8(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	-44(%ebp), %ebx
	addl	%eax, %ebx
	movl	%ebx, %edx
	leal	20(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -60(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-49(%ebp)
	movl	4(%ecx), %eax
	cmpl	-60(%ebp), %eax
	setb	%al
	orb	-49(%ebp), %al
	testb	%al, %al
	je	.L591
	movl	-60(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC429, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L591:
	movl	20(%ebx), %eax
	subl	$1, %eax
	movl	%eax, -48(%ebp)
	movl	%ebx, -64(%ebp)
	leal	20(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -68(%ebp)
	movl	-64(%ebp), %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	-64(%ebp), %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-68(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L592
	movl	-68(%ebp), %eax
	subl	-64(%ebp), %eax
	addl	$1, %eax
	movl	$.LC430, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-64(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L592:
	movl	-48(%ebp), %ecx
	movl	%ecx, 20(%ebx)
	addl	$1, -28(%ebp)
.L589:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$52, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L593
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC431, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L593:
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	-28(%ebp), %eax
	jg	.L594
	addl	$76, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE22:
	.size	clear_throttles, .-clear_throttles
	.section	.rodata
	.align 4
.LC432:
	.string	"thttpd.c:1940:46 (update_throttles)"
	.align 4
.LC433:
	.string	"thttpd.c:1940:69 (update_throttles)"
	.align 4
.LC434:
	.string	"thttpd.c:1940:23 (update_throttles)"
	.align 4
.LC435:
	.string	"thttpd.c:1941:34 (update_throttles)"
	.align 4
.LC436:
	.string	"thttpd.c:1943:22 (update_throttles)"
	.align 4
.LC437:
	.string	"thttpd.c:1943:45 (update_throttles)"
	.align 4
.LC438:
	.string	"thttpd.c:1943:74 (update_throttles)"
	.align 4
.LC439:
	.string	"thttpd.c:1945:26 (update_throttles)"
	.align 4
.LC440:
	.string	"thttpd.c:1945:49 (update_throttles)"
	.align 4
.LC441:
	.string	"thttpd.c:1946:9 (update_throttles)"
	.align 4
.LC442:
	.string	"throttle #%d '%.80s' rate %ld greatly exceeding limit %ld; %d sending"
	.align 4
.LC443:
	.string	"thttpd.c:1948:9 (update_throttles)"
	.align 4
.LC444:
	.string	"throttle #%d '%.80s' rate %ld exceeding limit %ld; %d sending"
	.align 4
.LC445:
	.string	"thttpd.c:1950:22 (update_throttles)"
	.align 4
.LC446:
	.string	"thttpd.c:1950:45 (update_throttles)"
	.align 4
.LC447:
	.string	"thttpd.c:1950:74 (update_throttles)"
	.align 4
.LC448:
	.string	"thttpd.c:1952:12 (update_throttles)"
	.align 4
.LC449:
	.string	"throttle #%d '%.80s' rate %ld lower than minimum %ld; %d sending"
	.align 4
.LC450:
	.string	"thttpd.c:1962:8 (update_throttles)"
	.align 4
.LC451:
	.string	"thttpd.c:1962:41 (update_throttles)"
	.align 4
.LC452:
	.string	"thttpd.c:1964:19 (update_throttles)"
	.align 4
.LC453:
	.string	"thttpd.c:1967:8 (update_throttles)"
	.align 4
.LC454:
	.string	"thttpd.c:1968:22 (update_throttles)"
	.align 4
.LC455:
	.string	"thttpd.c:1968:50 (update_throttles)"
	.align 4
.LC456:
	.string	"thttpd.c:1969:9 (update_throttles)"
	.align 4
.LC457:
	.string	"thttpd.c:1970:20 (update_throttles)"
	.align 4
.LC458:
	.string	"thttpd.c:1972:22 (update_throttles)"
	.align 4
.LC459:
	.string	"thttpd.c:1972:20 (update_throttles)"
	.align 4
.LC460:
	.string	"thttpd.c:1965:30 (update_throttles)"
	.text
	.type	update_throttles, @function
update_throttles:
.LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$332, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
	movl	$0, -28(%ebp)
	jmp	.L596
.L624:
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -60(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -64(%ebp)
	movl	-64(%ebp), %ebx
	movl	-64(%ebp), %eax
	addl	$12, %eax
	addl	$3, %eax
	movl	%eax, -200(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-200(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L597
	movl	-200(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC432, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L597:
	movl	-64(%ebp), %edx
	movl	12(%edx), %eax
	addl	%eax, %eax
	movl	%eax, -68(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -72(%ebp)
	movl	-72(%ebp), %ebx
	movl	-72(%ebp), %eax
	addl	$16, %eax
	addl	$3, %eax
	movl	%eax, -204(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-204(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L598
	movl	-204(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC433, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L598:
	movl	-72(%ebp), %edx
	movl	16(%edx), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	-68(%ebp), %ecx
	addl	%eax, %ecx
	movl	$1431655766, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, -76(%ebp)
	movl	-60(%ebp), %ebx
	movl	-60(%ebp), %eax
	addl	$12, %eax
	addl	$3, %eax
	movl	%eax, -208(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-208(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L599
	movl	-208(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC434, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L599:
	movl	-76(%ebp), %edx
	movl	-60(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	16(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -212(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-185(%ebp)
	movl	4(%ecx), %eax
	cmpl	-212(%ebp), %eax
	setb	%al
	orb	-185(%ebp), %al
	testb	%al, %al
	je	.L600
	movl	-212(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC435, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L600:
	movl	$0, 16(%ebx)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	12(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -216(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-186(%ebp)
	movl	4(%ecx), %eax
	cmpl	-216(%ebp), %eax
	setb	%al
	orb	-186(%ebp), %al
	testb	%al, %al
	je	.L601
	movl	-216(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC436, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L601:
	movl	12(%ebx), %ebx
	movl	%ebx, -80(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -84(%ebp)
	movl	-84(%ebp), %ebx
	movl	-84(%ebp), %eax
	addl	$4, %eax
	addl	$3, %eax
	movl	%eax, -220(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-220(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L602
	movl	-220(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC437, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L602:
	movl	-84(%ebp), %edx
	movl	4(%edx), %eax
	cmpl	%eax, -80(%ebp)
	jle	.L603
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	20(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -224(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-187(%ebp)
	movl	4(%ecx), %eax
	cmpl	-224(%ebp), %eax
	setb	%al
	orb	-187(%ebp), %al
	testb	%al, %al
	je	.L604
	movl	-224(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC438, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L604:
	movl	20(%ebx), %eax
	testl	%eax, %eax
	je	.L603
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	12(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -228(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-188(%ebp)
	movl	4(%ecx), %eax
	cmpl	-228(%ebp), %eax
	setb	%al
	orb	-188(%ebp), %al
	testb	%al, %al
	je	.L605
	movl	-228(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC439, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L605:
	movl	12(%ebx), %ebx
	movl	%ebx, -88(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -92(%ebp)
	movl	-92(%ebp), %ebx
	movl	-92(%ebp), %eax
	addl	$4, %eax
	addl	$3, %eax
	movl	%eax, -232(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-232(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L606
	movl	-232(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC440, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L606:
	movl	-92(%ebp), %edx
	movl	4(%edx), %eax
	addl	%eax, %eax
	cmpl	%eax, -88(%ebp)
	jle	.L607
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	20(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -236(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-189(%ebp)
	movl	4(%ecx), %eax
	cmpl	-236(%ebp), %eax
	setb	%al
	orb	-189(%ebp), %al
	testb	%al, %al
	je	.L608
	movl	-236(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC441, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L608:
	movl	20(%ebx), %ebx
	movl	%ebx, -96(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -100(%ebp)
	movl	-100(%ebp), %ebx
	movl	-100(%ebp), %eax
	addl	$4, %eax
	addl	$3, %eax
	movl	%eax, -240(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-240(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L609
	movl	-240(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC441, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L609:
	movl	-100(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -104(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -108(%ebp)
	movl	-108(%ebp), %ebx
	movl	-108(%ebp), %eax
	addl	$12, %eax
	addl	$3, %eax
	movl	%eax, -244(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-244(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L610
	movl	-244(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC441, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L610:
	movl	-108(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -112(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -116(%ebp)
	movl	-116(%ebp), %ebx
	movl	-116(%ebp), %eax
	addl	$3, %eax
	movl	%eax, -248(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-248(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L611
	movl	-248(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC441, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L611:
	movl	-116(%ebp), %edx
	movl	(%edx), %eax
	movl	-96(%ebp), %ecx
	movl	%ecx, 24(%esp)
	movl	-104(%ebp), %edx
	movl	%edx, 20(%esp)
	movl	-112(%ebp), %ecx
	movl	%ecx, 16(%esp)
	movl	%eax, 12(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC442, 4(%esp)
	movl	$5, (%esp)
	call	syslog
	jmp	.L603
.L607:
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	20(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -252(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-190(%ebp)
	movl	4(%ecx), %eax
	cmpl	-252(%ebp), %eax
	setb	%al
	orb	-190(%ebp), %al
	testb	%al, %al
	je	.L612
	movl	-252(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC443, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L612:
	movl	20(%ebx), %ebx
	movl	%ebx, -120(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -124(%ebp)
	movl	-124(%ebp), %ebx
	movl	-124(%ebp), %eax
	addl	$4, %eax
	addl	$3, %eax
	movl	%eax, -256(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-256(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L613
	movl	-256(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC443, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L613:
	movl	-124(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -128(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -132(%ebp)
	movl	-132(%ebp), %ebx
	movl	-132(%ebp), %eax
	addl	$12, %eax
	addl	$3, %eax
	movl	%eax, -260(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-260(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L614
	movl	-260(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC443, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L614:
	movl	-132(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -136(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -140(%ebp)
	movl	-140(%ebp), %ebx
	movl	-140(%ebp), %eax
	addl	$3, %eax
	movl	%eax, -264(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-264(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L615
	movl	-264(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC443, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L615:
	movl	-140(%ebp), %edx
	movl	(%edx), %eax
	movl	-120(%ebp), %ecx
	movl	%ecx, 24(%esp)
	movl	-128(%ebp), %edx
	movl	%edx, 20(%esp)
	movl	-136(%ebp), %ecx
	movl	%ecx, 16(%esp)
	movl	%eax, 12(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC444, 4(%esp)
	movl	$6, (%esp)
	call	syslog
.L603:
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	12(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -268(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-191(%ebp)
	movl	4(%ecx), %eax
	cmpl	-268(%ebp), %eax
	setb	%al
	orb	-191(%ebp), %al
	testb	%al, %al
	je	.L616
	movl	-268(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC445, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L616:
	movl	12(%ebx), %ebx
	movl	%ebx, -144(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -148(%ebp)
	movl	-148(%ebp), %ebx
	movl	-148(%ebp), %eax
	addl	$8, %eax
	addl	$3, %eax
	movl	%eax, -272(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-272(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L617
	movl	-272(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC446, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L617:
	movl	-148(%ebp), %edx
	movl	8(%edx), %eax
	cmpl	%eax, -144(%ebp)
	jge	.L618
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	20(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -276(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-192(%ebp)
	movl	4(%ecx), %eax
	cmpl	-276(%ebp), %eax
	setb	%al
	orb	-192(%ebp), %al
	testb	%al, %al
	je	.L619
	movl	-276(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC447, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L619:
	movl	20(%ebx), %eax
	testl	%eax, %eax
	je	.L618
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	20(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -280(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-193(%ebp)
	movl	4(%ecx), %eax
	cmpl	-280(%ebp), %eax
	setb	%al
	orb	-193(%ebp), %al
	testb	%al, %al
	je	.L620
	movl	-280(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC448, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L620:
	movl	20(%ebx), %ebx
	movl	%ebx, -152(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -156(%ebp)
	movl	-156(%ebp), %ebx
	movl	-156(%ebp), %eax
	addl	$8, %eax
	addl	$3, %eax
	movl	%eax, -284(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-284(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L621
	movl	-284(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC448, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L621:
	movl	-156(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -160(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -164(%ebp)
	movl	-164(%ebp), %ebx
	movl	-164(%ebp), %eax
	addl	$12, %eax
	addl	$3, %eax
	movl	%eax, -288(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-288(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L622
	movl	-288(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC448, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L622:
	movl	-164(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -168(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -172(%ebp)
	movl	-172(%ebp), %ebx
	movl	-172(%ebp), %eax
	addl	$3, %eax
	movl	%eax, -292(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-292(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L623
	movl	-292(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC448, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L623:
	movl	-172(%ebp), %edx
	movl	(%edx), %eax
	movl	-152(%ebp), %ecx
	movl	%ecx, 24(%esp)
	movl	-160(%ebp), %edx
	movl	%edx, 20(%esp)
	movl	-168(%ebp), %ecx
	movl	%ecx, 16(%esp)
	movl	%eax, 12(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC449, 4(%esp)
	movl	$5, (%esp)
	call	syslog
.L618:
	addl	$1, -28(%ebp)
.L596:
	movl	numthrottles, %eax
	cmpl	%eax, -28(%ebp)
	jl	.L624
	movl	$0, -36(%ebp)
	jmp	.L625
.L643:
	movl	connects, %ecx
	movl	-36(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	addl	%ecx, %eax
	movl	%eax, -40(%ebp)
	movl	-40(%ebp), %eax
	movl	-40(%ebp), %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L626
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC450, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L626:
	movl	-40(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	je	.L627
	movl	-40(%ebp), %eax
	movl	-40(%ebp), %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L628
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC451, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L628:
	movl	-40(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	jne	.L629
.L627:
	movl	-40(%ebp), %eax
	movl	-40(%ebp), %edx
	addl	$56, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L630
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC452, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L630:
	movl	-40(%ebp), %eax
	movl	$-1, 56(%eax)
	movl	$0, -32(%ebp)
	jmp	.L631
.L642:
	movl	-40(%ebp), %eax
	movl	-32(%ebp), %edx
	leal	0(,%edx,4), %ecx
	movl	-40(%ebp), %edx
	addl	%ecx, %edx
	addl	$12, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L632
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC453, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L632:
	movl	-40(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, -28(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %edx
	leal	4(%ebx), %eax
	addl	$3, %eax
	movl	%eax, -296(%ebp)
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-194(%ebp)
	movl	4(%ecx), %eax
	cmpl	-296(%ebp), %eax
	setb	%al
	orb	-194(%ebp), %al
	testb	%al, %al
	je	.L633
	movl	-296(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC454, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L633:
	movl	4(%ebx), %ebx
	movl	%ebx, -176(%ebp)
	movl	throttles, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -180(%ebp)
	movl	-180(%ebp), %ebx
	movl	-180(%ebp), %eax
	addl	$20, %eax
	addl	$3, %eax
	movl	%eax, -300(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-300(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L634
	movl	-300(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC455, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L634:
	movl	-180(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, -304(%ebp)
	movl	-176(%ebp), %eax
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	-304(%ebp)
	movl	%eax, -44(%ebp)
	movl	-40(%ebp), %eax
	movl	-40(%ebp), %edx
	addl	$56, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L635
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC456, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L635:
	movl	-40(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	$-1, %eax
	jne	.L636
	movl	-40(%ebp), %eax
	movl	-40(%ebp), %edx
	addl	$56, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L637
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC457, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L637:
	movl	-40(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	%edx, 56(%eax)
	jmp	.L638
.L636:
	movl	-40(%ebp), %eax
	movl	-40(%ebp), %edx
	addl	$56, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L639
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC458, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L639:
	movl	-40(%ebp), %eax
	movl	56(%eax), %edx
	movl	-44(%ebp), %eax
	cmpl	%eax, %edx
	movl	%eax, %ecx
	cmovle	%edx, %ecx
	movl	%ecx, -184(%ebp)
	movl	-40(%ebp), %edx
	movl	-40(%ebp), %eax
	addl	$56, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-195(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-195(%ebp), %al
	testb	%al, %al
	je	.L640
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC459, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L640:
	movl	-40(%ebp), %eax
	movl	-184(%ebp), %edx
	movl	%edx, 56(%eax)
.L638:
	addl	$1, -32(%ebp)
.L631:
	movl	-40(%ebp), %eax
	movl	-40(%ebp), %edx
	addl	$52, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L641
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC460, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L641:
	movl	-40(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	-32(%ebp), %eax
	jg	.L642
.L629:
	addl	$1, -36(%ebp)
.L625:
	movl	max_connects, %eax
	cmpl	%eax, -36(%ebp)
	jl	.L643
	addl	$332, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE23:
	.size	update_throttles, .-update_throttles
	.section	.rodata
	.align 4
.LC461:
	.string	"thttpd.c:1983:25 (finish_connection)"
	.text
	.type	finish_connection, @function
finish_connection:
.LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %edx
	movl	__mf_lc_mask, %esi
	movl	8(%ebp), %eax
	movl	8(%ebp), %ecx
	addl	$8, %ecx
	leal	3(%ecx), %ebx
	movl	%eax, %edi
	movl	%edx, %ecx
	shrl	%cl, %edi
	movl	%edi, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L645
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC461, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L645:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	httpd_write_response
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	clear_connection
	addl	$28, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE24:
	.size	finish_connection, .-finish_connection
	.section	.rodata
	.align 4
.LC462:
	.string	"thttpd.c:1995:11 (clear_connection)"
	.align 4
.LC463:
	.string	"thttpd.c:1997:12 (clear_connection)"
	.align 4
.LC464:
	.string	"thttpd.c:1998:18 (clear_connection)"
	.align 4
.LC465:
	.string	"thttpd.c:2012:11 (clear_connection)"
	.align 4
.LC466:
	.string	"thttpd.c:2015:12 (clear_connection)"
	.align 4
.LC467:
	.string	"thttpd.c:2016:18 (clear_connection)"
	.align 4
.LC468:
	.string	"thttpd.c:2017:3 (clear_connection)"
	.align 4
.LC469:
	.string	"thttpd.c:2017:23 (clear_connection)"
	.align 4
.LC470:
	.string	"thttpd.c:2019:11 (clear_connection)"
	.align 4
.LC471:
	.string	"thttpd.c:2019:15 (clear_connection)"
	.align 4
.LC472:
	.string	"thttpd.c:2021:8 (clear_connection)"
	.align 4
.LC473:
	.string	"thttpd.c:2022:23 (clear_connection)"
	.align 4
.LC474:
	.string	"thttpd.c:2022:20 (clear_connection)"
	.align 4
.LC475:
	.string	"thttpd.c:2023:16 (clear_connection)"
	.align 4
.LC476:
	.string	"thttpd.c:2024:13 (clear_connection)"
	.align 4
.LC477:
	.string	"thttpd.c:2024:10 (clear_connection)"
	.align 4
.LC478:
	.string	"thttpd.c:2025:19 (clear_connection)"
	.align 4
.LC479:
	.string	"thttpd.c:2025:16 (clear_connection)"
	.align 4
.LC480:
	.string	"thttpd.c:2027:8 (clear_connection)"
	.align 4
.LC481:
	.string	"replacing non-null linger_timer!"
	.align 4
.LC482:
	.string	"thttpd.c:2029:18 (clear_connection)"
	.align 4
.LC483:
	.string	"thttpd.c:2031:8 (clear_connection)"
	.align 4
.LC484:
	.string	"tmr_create(linger_clear_connection) failed"
	.text
	.type	clear_connection, @function
clear_connection:
.LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$92, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$72, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L647
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC462, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L647:
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	je	.L648
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$72, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L649
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC463, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L649:
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	movl	%eax, (%esp)
	call	tmr_cancel
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$72, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L650
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC464, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L650:
	movl	8(%ebp), %eax
	movl	$0, 72(%eax)
.L648:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L651
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC465, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L651:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	jne	.L652
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$76, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L653
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC466, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L653:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, (%esp)
	call	tmr_cancel
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$76, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L654
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC467, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L654:
	movl	8(%ebp), %eax
	movl	$0, 76(%eax)
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L655
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC468, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L655:
	movl	8(%ebp), %eax
	movl	8(%eax), %edi
	movl	%edi, %edx
	leal	356(%edi), %eax
	addl	$3, %eax
	movl	%eax, -52(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-41(%ebp)
	movl	4(%ecx), %eax
	cmpl	-52(%ebp), %eax
	setb	%al
	orb	-41(%ebp), %al
	testb	%al, %al
	je	.L656
	movl	-52(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC469, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L656:
	movl	$0, 356(%edi)
.L652:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L657
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC470, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L657:
	movl	8(%ebp), %eax
	movl	8(%eax), %edi
	movl	%edi, %edx
	leal	356(%edi), %eax
	addl	$3, %eax
	movl	%eax, -56(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-42(%ebp)
	movl	4(%ecx), %eax
	cmpl	-56(%ebp), %eax
	setb	%al
	orb	-42(%ebp), %al
	testb	%al, %al
	je	.L658
	movl	-56(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC471, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L658:
	movl	356(%edi), %eax
	testl	%eax, %eax
	je	.L659
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L660
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC472, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L660:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	je	.L661
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L662
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC473, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L662:
	movl	8(%ebp), %eax
	movl	8(%eax), %edi
	movl	%edi, %edx
	leal	448(%edi), %eax
	addl	$3, %eax
	movl	%eax, -60(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-43(%ebp)
	movl	4(%ecx), %eax
	cmpl	-60(%ebp), %eax
	setb	%al
	orb	-43(%ebp), %al
	testb	%al, %al
	je	.L663
	movl	-60(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC474, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L663:
	movl	448(%edi), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
.L661:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L664
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC475, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L664:
	movl	8(%ebp), %eax
	movl	$4, (%eax)
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L665
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC476, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L665:
	movl	8(%ebp), %eax
	movl	8(%eax), %edi
	movl	%edi, %edx
	leal	448(%edi), %eax
	addl	$3, %eax
	movl	%eax, -64(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-44(%ebp)
	movl	4(%ecx), %eax
	cmpl	-64(%ebp), %eax
	setb	%al
	orb	-44(%ebp), %al
	testb	%al, %al
	je	.L666
	movl	-64(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC477, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L666:
	movl	448(%edi), %eax
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	shutdown
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L667
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC478, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L667:
	movl	8(%ebp), %eax
	movl	8(%eax), %edi
	movl	%edi, %edx
	leal	448(%edi), %eax
	addl	$3, %eax
	movl	%eax, -68(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-45(%ebp)
	movl	4(%ecx), %eax
	cmpl	-68(%ebp), %eax
	setb	%al
	orb	-45(%ebp), %al
	testb	%al, %al
	je	.L668
	movl	-68(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC479, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L668:
	movl	448(%edi), %eax
	movl	$0, 8(%esp)
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fdwatch_add_fd
	movl	8(%ebp), %eax
	movl	%eax, -28(%ebp)
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$76, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L669
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC480, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L669:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	testl	%eax, %eax
	je	.L670
	movl	$.LC481, 4(%esp)
	movl	$3, (%esp)
	call	syslog
.L670:
	movl	$0, 16(%esp)
	movl	$500, 12(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$linger_clear_connection, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	tmr_create
	movl	%eax, %edi
	movl	8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$76, %eax
	addl	$3, %eax
	movl	%eax, -72(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-46(%ebp)
	movl	4(%ecx), %eax
	cmpl	-72(%ebp), %eax
	setb	%al
	orb	-46(%ebp), %al
	testb	%al, %al
	je	.L671
	movl	-72(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC482, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L671:
	movl	8(%ebp), %eax
	movl	%edi, 76(%eax)
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$76, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L672
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC483, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L672:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	testl	%eax, %eax
	jne	.L646
	movl	$.LC484, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$1, (%esp)
	call	exit
.L659:
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	really_clear_connection
.L646:
	addl	$92, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE25:
	.size	clear_connection, .-clear_connection
	.section	.rodata
	.align 4
.LC485:
	.string	"thttpd.c:2045:21 (really_clear_connection)"
	.align 4
.LC486:
	.string	"thttpd.c:2045:25 (really_clear_connection)"
	.align 4
.LC487:
	.string	"thttpd.c:2046:11 (really_clear_connection)"
	.align 4
.LC488:
	.string	"thttpd.c:2047:19 (really_clear_connection)"
	.align 4
.LC489:
	.string	"thttpd.c:2047:16 (really_clear_connection)"
	.align 4
.LC490:
	.string	"thttpd.c:2048:21 (really_clear_connection)"
	.align 4
.LC491:
	.string	"thttpd.c:2050:11 (really_clear_connection)"
	.align 4
.LC492:
	.string	"thttpd.c:2052:12 (really_clear_connection)"
	.align 4
.LC493:
	.string	"thttpd.c:2053:18 (really_clear_connection)"
	.align 4
.LC494:
	.string	"thttpd.c:2055:19 (really_clear_connection)"
	.align 4
.LC495:
	.string	"thttpd.c:2056:26 (really_clear_connection)"
	.text
	.type	really_clear_connection, @function
really_clear_connection:
.LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L675
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC485, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L675:
	movl	8(%ebp), %eax
	movl	8(%eax), %edi
	movl	%edi, %edx
	leal	168(%edi), %eax
	addl	$3, %eax
	movl	%eax, -36(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-29(%ebp)
	movl	4(%ecx), %eax
	cmpl	-36(%ebp), %eax
	setb	%al
	orb	-29(%ebp), %al
	testb	%al, %al
	je	.L676
	movl	-36(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC486, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L676:
	movl	168(%edi), %edx
	movl	stats_bytes, %eax
	addl	%edx, %eax
	movl	%eax, stats_bytes
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L677
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC487, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L677:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	je	.L678
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L679
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC488, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L679:
	movl	8(%ebp), %eax
	movl	8(%eax), %edi
	movl	%edi, %edx
	leal	448(%edi), %eax
	addl	$3, %eax
	movl	%eax, -40(%ebp)
	movl	%edx, %eax
	movl	%ebx, %ecx
	shrl	%cl, %eax
	andl	%esi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-30(%ebp)
	movl	4(%ecx), %eax
	cmpl	-40(%ebp), %eax
	setb	%al
	orb	-30(%ebp), %al
	testb	%al, %al
	je	.L680
	movl	-40(%ebp), %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC489, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L680:
	movl	448(%edi), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
.L678:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L681
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC490, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L681:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	httpd_close_conn
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	clear_throttles
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$76, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L682
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC491, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L682:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	testl	%eax, %eax
	je	.L683
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$76, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L684
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC492, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L684:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, (%esp)
	call	tmr_cancel
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$76, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L685
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC493, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L685:
	movl	8(%ebp), %eax
	movl	$0, 76(%eax)
.L683:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L686
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC494, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %ebx
	movl	__mf_lc_mask, %esi
.L686:
	movl	8(%ebp), %eax
	movl	$0, (%eax)
	movl	first_free_connect, %eax
	movl	%eax, -28(%ebp)
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$4, %edx
	leal	3(%edx), %edi
	movl	%eax, %edx
	movl	%ebx, %ecx
	shrl	%cl, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%edi, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L687
	movl	%edi, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC495, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L687:
	movl	8(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	8(%ebp), %edx
	movl	connects, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	sarl	$5, %eax
	imull	$-1431655765, %eax, %eax
	movl	%eax, first_free_connect
	movl	num_connects, %eax
	subl	$1, %eax
	movl	%eax, num_connects
	addl	$44, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE26:
	.size	really_clear_connection, .-really_clear_connection
	.section	.rodata
.LC496:
	.string	"thttpd.c:2071:12 (idle)"
.LC497:
	.string	"thttpd.c:2074:15 (idle)"
.LC498:
	.string	"thttpd.c:2074:27 (idle)"
.LC499:
	.string	"thttpd.c:2078:21 (idle)"
	.align 4
.LC500:
	.string	"%.80s connection timed out reading"
.LC501:
	.string	"thttpd.c:2079:17 (idle)"
.LC502:
	.string	"thttpd.c:2086:15 (idle)"
.LC503:
	.string	"thttpd.c:2086:27 (idle)"
.LC504:
	.string	"thttpd.c:2090:21 (idle)"
	.align 4
.LC505:
	.string	"%.80s connection timed out sending"
	.text
	.type	idle, @function
idle:
.LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$92, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
	movl	$0, -28(%ebp)
	jmp	.L689
.L703:
	movl	connects, %ecx
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	addl	%ecx, %eax
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L690
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC496, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L690:
	movl	-32(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	je	.L692
	cmpl	$1, %eax
	jl	.L691
	cmpl	$3, %eax
	jg	.L691
	jmp	.L704
.L692:
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L694
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC497, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L694:
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -44(%ebp)
	movl	-32(%ebp), %edx
	movl	-32(%ebp), %eax
	addl	$68, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-57(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-57(%ebp), %al
	testb	%al, %al
	je	.L695
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC498, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L695:
	movl	-32(%ebp), %eax
	movl	68(%eax), %eax
	movl	-44(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	cmpl	$59, %eax
	jle	.L705
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L697
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC499, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L697:
	movl	-32(%ebp), %eax
	movl	8(%eax), %eax
	addl	$8, %eax
	movl	%eax, (%esp)
	call	httpd_ntoa
	movl	%eax, 8(%esp)
	movl	$.LC500, 4(%esp)
	movl	$6, (%esp)
	call	syslog
	movl	httpd_err408form, %eax
	movl	%eax, -48(%ebp)
	movl	httpd_err408title, %edx
	movl	%edx, -52(%ebp)
	movl	-32(%ebp), %ebx
	movl	-32(%ebp), %eax
	addl	$8, %eax
	addl	$3, %eax
	movl	%eax, -64(%ebp)
	movl	%ebx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %edx
	movl	(%edx), %eax
	cmpl	%ebx, %eax
	seta	%cl
	movl	4(%edx), %eax
	cmpl	-64(%ebp), %eax
	setb	%al
	orl	%ecx, %eax
	testb	%al, %al
	je	.L698
	movl	-64(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC501, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L698:
	movl	-32(%ebp), %eax
	movl	8(%eax), %eax
	movl	$.LC96, 20(%esp)
	movl	-48(%ebp), %edx
	movl	%edx, 16(%esp)
	movl	$.LC96, 12(%esp)
	movl	-52(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	$408, 4(%esp)
	movl	%eax, (%esp)
	call	httpd_send_err
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L705
.L704:
	movl	12(%ebp), %eax
	movl	12(%ebp), %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L699
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC502, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L699:
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -56(%ebp)
	movl	-32(%ebp), %edx
	movl	-32(%ebp), %eax
	addl	$68, %eax
	leal	3(%eax), %ebx
	movl	%edx, %eax
	movl	%esi, %ecx
	shrl	%cl, %eax
	andl	%edi, %eax
	sall	$3, %eax
	leal	__mf_lookup_cache(%eax), %ecx
	movl	(%ecx), %eax
	cmpl	%edx, %eax
	seta	-58(%ebp)
	movl	4(%ecx), %eax
	cmpl	%ebx, %eax
	setb	%al
	orb	-58(%ebp), %al
	testb	%al, %al
	je	.L700
	movl	%ebx, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	$.LC503, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L700:
	movl	-32(%ebp), %eax
	movl	68(%eax), %eax
	movl	-56(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	cmpl	$299, %eax
	jle	.L706
	movl	-32(%ebp), %eax
	movl	-32(%ebp), %edx
	addl	$8, %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L702
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC504, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
.L702:
	movl	-32(%ebp), %eax
	movl	8(%eax), %eax
	addl	$8, %eax
	movl	%eax, (%esp)
	call	httpd_ntoa
	movl	%eax, 8(%esp)
	movl	$.LC505, 4(%esp)
	movl	$6, (%esp)
	call	syslog
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	clear_connection
	jmp	.L706
.L705:
	nop
	jmp	.L691
.L706:
	nop
.L691:
	addl	$1, -28(%ebp)
.L689:
	movl	max_connects, %eax
	cmpl	%eax, -28(%ebp)
	jl	.L703
	addl	$92, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE27:
	.size	idle, .-idle
	.section	.rodata
	.align 4
.LC506:
	.string	"thttpd.c:2105:21 (wakeup_connection)"
	.align 4
.LC507:
	.string	"thttpd.c:2106:11 (wakeup_connection)"
	.align 4
.LC508:
	.string	"thttpd.c:2108:16 (wakeup_connection)"
	.align 4
.LC509:
	.string	"thttpd.c:2109:19 (wakeup_connection)"
	.align 4
.LC510:
	.string	"thttpd.c:2109:16 (wakeup_connection)"
	.text
	.type	wakeup_connection, @function
wakeup_connection:
.LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %eax
	movl	__mf_lc_mask, %edx
	movl	8(%ebp), %ecx
	movl	%ecx, -28(%ebp)
	movl	-28(%ebp), %ebx
	movl	-28(%ebp), %ecx
	addl	$72, %ecx
	leal	3(%ecx), %esi
	movl	%ebx, %edi
	movl	%eax, %ecx
	shrl	%cl, %edi
	movl	%edi, -44(%ebp)
	movl	-44(%ebp), %ecx
	andl	%edx, %ecx
	sall	$3, %ecx
	addl	$__mf_lookup_cache, %ecx
	movl	%ecx, -44(%ebp)
	movl	-44(%ebp), %ecx
	movl	(%ecx), %edi
	cmpl	%ebx, %edi
	seta	%cl
	movl	%ecx, %edi
	movl	-44(%ebp), %ecx
	movl	4(%ecx), %ecx
	movl	%ecx, -44(%ebp)
	cmpl	%esi, -44(%ebp)
	setb	%cl
	orl	%edi, %ecx
	testb	%cl, %cl
	je	.L708
	movl	%esi, %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC506, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %eax
	movl	__mf_lc_mask, %edx
.L708:
	movl	-28(%ebp), %ecx
	movl	$0, 72(%ecx)
	movl	-28(%ebp), %ebx
	movl	-28(%ebp), %ecx
	leal	3(%ecx), %esi
	movl	%ebx, %edi
	movl	%eax, %ecx
	shrl	%cl, %edi
	movl	%edi, -44(%ebp)
	movl	-44(%ebp), %ecx
	andl	%edx, %ecx
	sall	$3, %ecx
	addl	$__mf_lookup_cache, %ecx
	movl	%ecx, -44(%ebp)
	movl	-44(%ebp), %ecx
	movl	(%ecx), %edi
	cmpl	%ebx, %edi
	seta	%cl
	movl	%ecx, %edi
	movl	-44(%ebp), %ecx
	movl	4(%ecx), %ecx
	movl	%ecx, -44(%ebp)
	cmpl	%esi, -44(%ebp)
	setb	%cl
	orl	%edi, %ecx
	testb	%cl, %cl
	je	.L709
	movl	%esi, %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC507, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %eax
	movl	__mf_lc_mask, %edx
.L709:
	movl	-28(%ebp), %ecx
	movl	(%ecx), %ecx
	cmpl	$3, %ecx
	jne	.L707
	movl	-28(%ebp), %ebx
	movl	-28(%ebp), %ecx
	leal	3(%ecx), %esi
	movl	%ebx, %edi
	movl	%eax, %ecx
	shrl	%cl, %edi
	movl	%edi, -44(%ebp)
	movl	-44(%ebp), %ecx
	andl	%edx, %ecx
	sall	$3, %ecx
	addl	$__mf_lookup_cache, %ecx
	movl	%ecx, -44(%ebp)
	movl	-44(%ebp), %ecx
	movl	(%ecx), %edi
	cmpl	%ebx, %edi
	seta	%cl
	movl	%ecx, %edi
	movl	-44(%ebp), %ecx
	movl	4(%ecx), %ecx
	movl	%ecx, -44(%ebp)
	cmpl	%esi, -44(%ebp)
	setb	%cl
	orl	%edi, %ecx
	testb	%cl, %cl
	je	.L711
	movl	%esi, %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC508, 12(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %eax
	movl	__mf_lc_mask, %edx
.L711:
	movl	-28(%ebp), %ecx
	movl	$2, (%ecx)
	movl	-28(%ebp), %ebx
	movl	-28(%ebp), %ecx
	addl	$8, %ecx
	leal	3(%ecx), %esi
	movl	%ebx, %edi
	movl	%eax, %ecx
	shrl	%cl, %edi
	movl	%edi, -44(%ebp)
	movl	-44(%ebp), %ecx
	andl	%edx, %ecx
	sall	$3, %ecx
	addl	$__mf_lookup_cache, %ecx
	movl	%ecx, -44(%ebp)
	movl	-44(%ebp), %ecx
	movl	(%ecx), %edi
	cmpl	%ebx, %edi
	seta	%cl
	movl	%ecx, %edi
	movl	-44(%ebp), %ecx
	movl	4(%ecx), %ecx
	movl	%ecx, -44(%ebp)
	cmpl	%esi, -44(%ebp)
	setb	%cl
	orl	%edi, %ecx
	testb	%cl, %cl
	je	.L712
	movl	%esi, %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC509, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
	movzbl	__mf_lc_shift, %eax
	movl	__mf_lc_mask, %edx
.L712:
	movl	-28(%ebp), %ecx
	movl	8(%ecx), %esi
	movl	%esi, %ebx
	leal	448(%esi), %ecx
	addl	$3, %ecx
	movl	%ecx, -48(%ebp)
	movl	%ebx, %edi
	movl	%eax, %ecx
	shrl	%cl, %edi
	movl	%edi, %eax
	andl	%edx, %eax
	sall	$3, %eax
	addl	$__mf_lookup_cache, %eax
	movl	(%eax), %edx
	cmpl	%ebx, %edx
	seta	%dl
	movl	4(%eax), %eax
	cmpl	-48(%ebp), %eax
	setb	%al
	orl	%edx, %eax
	testb	%al, %al
	je	.L713
	movl	-48(%ebp), %eax
	subl	%ebx, %eax
	addl	$1, %eax
	movl	$.LC510, 12(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__mf_check
.L713:
	movl	448(%esi), %eax
	movl	$1, 8(%esp)
	movl	-28(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fdwatch_add_fd
.L707:
	addl	$60, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE28:
	.size	wakeup_connection, .-wakeup_connection
	.section	.rodata
	.align 4
.LC511:
	.string	"thttpd.c:2119:21 (linger_clear_connection)"
	.text
	.type	linger_clear_connection, @function
linger_clear_connection:
.LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %edx
	movl	__mf_lc_mask, %esi
	movl	8(%ebp), %eax
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	movl	-28(%ebp), %ecx
	addl	$76, %ecx
	leal	3(%ecx), %ebx
	movl	%eax, %edi
	movl	%edx, %ecx
	shrl	%cl, %edi
	movl	%edi, %edx
	andl	%esi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L715
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC511, 12(%esp)
	movl	$1, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L715:
	movl	-28(%ebp), %eax
	movl	$0, 76(%eax)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	really_clear_connection
	addl	$44, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE29:
	.size	linger_clear_connection, .-linger_clear_connection
	.type	occasional, @function
occasional:
.LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	mmc_cleanup
	call	tmr_cleanup
	movl	$1, watchdog_flag
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE30:
	.size	occasional, .-occasional
	.type	show_stats, @function
show_stats:
.LFB31:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	logstats
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE31:
	.size	show_stats, .-show_stats
	.section	.rodata
	.align 4
.LC512:
	.string	"thttpd.c:2146:20 (logstats) tv"
.LC513:
	.string	"thttpd.c:2155:9 (logstats)"
	.align 4
.LC514:
	.string	"up %ld seconds, stats for %ld seconds:"
	.text
	.type	logstats, @function
logstats:
.LFB32:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movzbl	__mf_lc_shift, %esi
	movl	__mf_lc_mask, %edi
	movl	$.LC512, 12(%esp)
	movl	$3, 8(%esp)
	movl	$8, 4(%esp)
	leal	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_register
	cmpl	$0, 8(%ebp)
	jne	.L719
	movl	$0, 4(%esp)
	leal	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	gettimeofday
	leal	-44(%ebp), %eax
	movl	%eax, 8(%ebp)
.L719:
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	leal	3(%edx), %ebx
	movl	%eax, %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	%edi, %edx
	sall	$3, %edx
	addl	$__mf_lookup_cache, %edx
	movl	(%edx), %ecx
	cmpl	%eax, %ecx
	seta	%cl
	movl	4(%edx), %edx
	cmpl	%ebx, %edx
	setb	%dl
	orl	%ecx, %edx
	testb	%dl, %dl
	je	.L720
	movl	%ebx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	$.LC513, 12(%esp)
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__mf_check
.L720:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -32(%ebp)
	movl	start_time, %eax
	movl	-32(%ebp), %edx
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -36(%ebp)
	movl	stats_time, %eax
	movl	-32(%ebp), %edx
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -28(%ebp)
	cmpl	$0, -28(%ebp)
	jne	.L721
	movl	$1, -28(%ebp)
.L721:
	movl	-32(%ebp), %eax
	movl	%eax, stats_time
	movl	-28(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC514, 4(%esp)
	movl	$6, (%esp)
	call	syslog
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	thttpd_logstats
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_logstats
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	mmc_logstats
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	fdwatch_logstats
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	tmr_logstats
	movl	$3, 8(%esp)
	movl	$8, 4(%esp)
	leal	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	__mf_unregister
	addl	$60, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE32:
	.size	logstats, .-logstats
	.section	.rodata
	.align 4
.LC515:
	.string	"  thttpd - %ld connections (%g/sec), %d max simultaneous, %lld bytes (%g/sec), %d httpd_conns allocated"
	.text
	.type	thttpd_logstats, @function
thttpd_logstats:
.LFB33:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$64, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	cmpl	$0, 8(%ebp)
	jle	.L723
	movl	httpd_conn_count, %esi
	movl	stats_bytes, %eax
	movl	%eax, -12(%ebp)
	fildl	-12(%ebp)
	fildl	8(%ebp)
	fdivrp	%st, %st(1)
	movl	stats_bytes, %eax
	movl	%eax, %edx
	sarl	$31, %edx
	movl	stats_simultaneous, %ebx
	movl	stats_connections, %ecx
	movl	%ecx, -12(%ebp)
	fildl	-12(%ebp)
	fildl	8(%ebp)
	fdivrp	%st, %st(1)
	fxch	%st(1)
	movl	stats_connections, %ecx
	movl	%esi, 40(%esp)
	fstpl	32(%esp)
	movl	%eax, 24(%esp)
	movl	%edx, 28(%esp)
	movl	%ebx, 20(%esp)
	fstpl	12(%esp)
	movl	%ecx, 8(%esp)
	movl	$.LC515, 4(%esp)
	movl	$6, (%esp)
	call	syslog
.L723:
	movl	$0, stats_connections
	movl	$0, stats_bytes
	movl	$0, stats_simultaneous
	addl	$64, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE33:
	.size	thttpd_logstats, .-thttpd_logstats
	.section	.rodata
.LC517:
	.string	"string literal"
.LC518:
	.string	"thttpd.c:129:5 terminate"
.LC519:
	.string	"thttpd.c:130:8 start_time"
.LC520:
	.string	"thttpd.c:130:20 stats_time"
	.align 4
.LC521:
	.string	"thttpd.c:131:6 stats_connections"
.LC522:
	.string	"thttpd.c:132:7 stats_bytes"
	.align 4
.LC523:
	.string	"thttpd.c:133:5 stats_simultaneous"
	.align 4
.LC524:
	.string	"/usr/include/stdio.h:167:25 stderr"
	.align 4
.LC525:
	.string	"/usr/include/stdio.h:166:25 stdout"
	.align 4
.LC526:
	.string	"/usr/include/stdio.h:165:25 stdin"
	.align 4
.LC527:
	.string	"./timers.h:48:19 JunkClientData"
	.align 4
.LC528:
	.string	"./libhttpd.h:254:14 httpd_err400form"
	.align 4
.LC529:
	.string	"./libhttpd.h:253:14 httpd_err400title"
	.align 4
.LC530:
	.string	"./libhttpd.h:258:14 httpd_err503form"
	.align 4
.LC531:
	.string	"./libhttpd.h:257:14 httpd_err503title"
	.align 4
.LC532:
	.string	"./libhttpd.h:256:14 httpd_err408form"
	.align 4
.LC533:
	.string	"./libhttpd.h:255:14 httpd_err408title"
	.text
	.type	_GLOBAL__sub_I_00099_0_terminate, @function
_GLOBAL__sub_I_00099_0_terminate:
.LFB34:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	__mf_init
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$25, 4(%esp)
	movl	$.LC0, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$16, 4(%esp)
	movl	$.LC6, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$8, 4(%esp)
	movl	$.LC14, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$5, 4(%esp)
	movl	$.LC18, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$2, 4(%esp)
	movl	$.LC20, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$19, 4(%esp)
	movl	$.LC21, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$2, 4(%esp)
	movl	$.LC22, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$22, 4(%esp)
	movl	$.LC23, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$29, 4(%esp)
	movl	$.LC31, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$34, 4(%esp)
	movl	$.LC32, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$23, 4(%esp)
	movl	$.LC33, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$25, 4(%esp)
	movl	$.LC34, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$10, 4(%esp)
	movl	$.LC37, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$11, 4(%esp)
	movl	$.LC38, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$67, 4(%esp)
	movl	$.LC40, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$72, 4(%esp)
	movl	$.LC41, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$20, 4(%esp)
	movl	$.LC42, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$15, 4(%esp)
	movl	$.LC43, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$11, 4(%esp)
	movl	$.LC44, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$6, 4(%esp)
	movl	$.LC45, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$2, 4(%esp)
	movl	$.LC47, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$12, 4(%esp)
	movl	$.LC48, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$2, 4(%esp)
	movl	$.LC49, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$.LC50, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$31, 4(%esp)
	movl	$.LC51, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$12, 4(%esp)
	movl	$.LC52, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$7, 4(%esp)
	movl	$.LC53, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$74, 4(%esp)
	movl	$.LC54, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$79, 4(%esp)
	movl	$.LC55, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$18, 4(%esp)
	movl	$.LC56, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$13, 4(%esp)
	movl	$.LC57, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$20, 4(%esp)
	movl	$.LC58, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$15, 4(%esp)
	movl	$.LC59, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$30, 4(%esp)
	movl	$.LC60, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$24, 4(%esp)
	movl	$.LC61, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$36, 4(%esp)
	movl	$.LC62, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$30, 4(%esp)
	movl	$.LC63, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$15, 4(%esp)
	movl	$.LC64, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$12, 4(%esp)
	movl	$.LC65, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$16, 4(%esp)
	movl	$.LC66, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$12, 4(%esp)
	movl	$.LC67, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$58, 4(%esp)
	movl	$.LC68, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$38, 4(%esp)
	movl	$.LC69, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$13, 4(%esp)
	movl	$.LC80, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$7, 4(%esp)
	movl	$.LC94, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$11, 4(%esp)
	movl	$.LC95, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$1, 4(%esp)
	movl	$.LC96, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.LC98, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$28, 4(%esp)
	movl	$.LC99, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$.LC100, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.LC102, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.LC105, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.LC108, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.LC111, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$5, 4(%esp)
	movl	$.LC113, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$.LC115, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.LC118, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$5, 4(%esp)
	movl	$.LC120, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.LC122, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.LC125, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.LC128, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.LC131, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.LC134, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.LC137, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$5, 4(%esp)
	movl	$.LC139, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.LC141, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$5, 4(%esp)
	movl	$.LC143, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.LC145, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.LC148, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.LC151, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.LC154, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.LC157, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$219, 4(%esp)
	movl	$.LC160, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$2, 4(%esp)
	movl	$.LC162, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$5, 4(%esp)
	movl	$.LC164, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$6, 4(%esp)
	movl	$.LC171, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$5, 4(%esp)
	movl	$.LC172, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$.LC173, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$9, 4(%esp)
	movl	$.LC174, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$9, 4(%esp)
	movl	$.LC175, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$8, 4(%esp)
	movl	$.LC176, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$10, 4(%esp)
	movl	$.LC177, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$9, 4(%esp)
	movl	$.LC178, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$11, 4(%esp)
	movl	$.LC179, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$5, 4(%esp)
	movl	$.LC180, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$7, 4(%esp)
	movl	$.LC181, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$9, 4(%esp)
	movl	$.LC182, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$7, 4(%esp)
	movl	$.LC183, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$16, 4(%esp)
	movl	$.LC184, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$9, 4(%esp)
	movl	$.LC185, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$10, 4(%esp)
	movl	$.LC186, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$5, 4(%esp)
	movl	$.LC187, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$8, 4(%esp)
	movl	$.LC188, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$6, 4(%esp)
	movl	$.LC189, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$8, 4(%esp)
	movl	$.LC190, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$13, 4(%esp)
	movl	$.LC191, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$15, 4(%esp)
	movl	$.LC192, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$8, 4(%esp)
	movl	$.LC193, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$8, 4(%esp)
	movl	$.LC194, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$.LC195, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$8, 4(%esp)
	movl	$.LC196, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$32, 4(%esp)
	movl	$.LC197, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$34, 4(%esp)
	movl	$.LC199, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$37, 4(%esp)
	movl	$.LC200, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$31, 4(%esp)
	movl	$.LC201, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$36, 4(%esp)
	movl	$.LC202, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.LC206, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$26, 4(%esp)
	movl	$.LC207, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$25, 4(%esp)
	movl	$.LC208, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$39, 4(%esp)
	movl	$.LC214, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$20, 4(%esp)
	movl	$.LC235, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$16, 4(%esp)
	movl	$.LC236, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$33, 4(%esp)
	movl	$.LC237, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$38, 4(%esp)
	movl	$.LC238, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.LC240, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$39, 4(%esp)
	movl	$.LC241, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$44, 4(%esp)
	movl	$.LC242, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$22, 4(%esp)
	movl	$.LC260, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$36, 4(%esp)
	movl	$.LC262, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$39, 4(%esp)
	movl	$.LC266, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$33, 4(%esp)
	movl	$.LC348, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$37, 4(%esp)
	movl	$.LC352, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$25, 4(%esp)
	movl	$.LC357, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$56, 4(%esp)
	movl	$.LC409, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$70, 4(%esp)
	movl	$.LC442, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$62, 4(%esp)
	movl	$.LC444, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$65, 4(%esp)
	movl	$.LC449, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$33, 4(%esp)
	movl	$.LC481, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$43, 4(%esp)
	movl	$.LC484, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$35, 4(%esp)
	movl	$.LC500, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$35, 4(%esp)
	movl	$.LC505, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$39, 4(%esp)
	movl	$.LC514, (%esp)
	call	__mf_register
	movl	$.LC517, 12(%esp)
	movl	$4, 8(%esp)
	movl	$104, 4(%esp)
	movl	$.LC515, (%esp)
	call	__mf_register
	movl	$.LC518, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$terminate, (%esp)
	call	__mf_register
	movl	$.LC519, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$start_time, (%esp)
	call	__mf_register
	movl	$.LC520, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$stats_time, (%esp)
	call	__mf_register
	movl	$.LC521, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$stats_connections, (%esp)
	call	__mf_register
	movl	$.LC522, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$stats_bytes, (%esp)
	call	__mf_register
	movl	$.LC523, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$stats_simultaneous, (%esp)
	call	__mf_register
	movl	$.LC524, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$stderr, (%esp)
	call	__mf_register
	movl	$.LC525, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$stdout, (%esp)
	call	__mf_register
	movl	$.LC526, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$stdin, (%esp)
	call	__mf_register
	movl	$.LC527, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$JunkClientData, (%esp)
	call	__mf_register
	movl	$.LC528, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$httpd_err400form, (%esp)
	call	__mf_register
	movl	$.LC529, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$httpd_err400title, (%esp)
	call	__mf_register
	movl	$.LC530, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$httpd_err503form, (%esp)
	call	__mf_register
	movl	$.LC531, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$httpd_err503title, (%esp)
	call	__mf_register
	movl	$.LC532, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$httpd_err408form, (%esp)
	call	__mf_register
	movl	$.LC533, 12(%esp)
	movl	$4, 8(%esp)
	movl	$4, 4(%esp)
	movl	$httpd_err408title, (%esp)
	call	__mf_register
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE34:
	.size	_GLOBAL__sub_I_00099_0_terminate, .-_GLOBAL__sub_I_00099_0_terminate
	.section	.ctors.65436,"aw",@progbits
	.align 4
	.long	_GLOBAL__sub_I_00099_0_terminate
	.ident	"GCC: (GNU) 4.7.2"
	.section	.note.GNU-stack,"",@progbits
