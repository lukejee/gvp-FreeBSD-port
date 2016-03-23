# Created by: Luke Jee <lukejee@gmail.com>
# $FreeBSD$

PORTNAME=	gvp
PORTVERSION=	0.3.0
CATEGORIES=	devel

MAINTAINER=	lukejee@gmail.com
COMMENT=	Go Versioning Manager

LICENSE=	MIT

RUN_DEPENDS=	bash:${PORTSDIR}/shells/bash \
				go:${PORTSDIR}/lang/go

USE_GITHUB= yes
GH_ACCOUNT= pote
GH_PROJECT= gvp
GH_TAGNAME= 8bcab74

ONLY_FOR_ARCHS=	amd64 i386

PLIST_FILES= bin/gvp

.include <bsd.port.pre.mk>

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/bin/gvp ${STAGEDIR}${PREFIX}/bin/

post-patch:
	@${REINPLACE_CMD} -e \
		's|/bin/bash|${PREFIX}/bin/bash|' ${WRKSRC}/bin/gvp

.include <bsd.port.post.mk>
