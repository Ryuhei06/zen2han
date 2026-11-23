#!/bin/bash
# SPDX-FileCopyrightText: 2026 奈良隆平
# SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo "${1}行目が違うよ"
	res=1
}

res=0

out=$(echo １２３ | ./zen2han)
[ "${out}" = 123 ] || ng "$LINENO"

exit $res
