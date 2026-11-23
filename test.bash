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

out=$(printf 'ＡＢＣ\xe3\x80\x80ｘｙｚ\n' | ./zen2han)
[ "${out}" = "ABC xyz" ] || ng "$LINENO"

out=$(echo "！？（）" | ./zen2han)
[ "${out}" = "!?()" ] || ng "$LINENO"

out=$(echo "墨田区１－２－３" | ./zen2han)
[ "${out}" = "墨田区1-2-3" ] || ng "$LINENO"

out=$(echo "ｱｲｳ カレー" | ./zen2han)
[ "${out}" = "ｱｲｳ カレー" ] || ng "$LINENO"

out=$(echo -n "" | ./zen2han)
[ "${out}" = "" ] || ng "$LINENO"

out=$(printf '１\n２\n' | ./zen2han)
[ "${out}" = "$(printf '1\n2')" ] || ng "$LINENO"

out=$(echo "１Ａ！" | ./zen2han -d)
[ "${out}" = "1Ａ！" ] || ng "$LINENO"

out=$(echo "１Ａ！" | ./zen2han -a)
[ "${out}" = "１A！" ] || ng "$LINENO"

out=$(echo "１Ａ！" | ./zen2han -s)
[ "${out}" = "１Ａ!" ] || ng "$LINENO"

exit $res
