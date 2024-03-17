package s0394_decode_string

// #Medium #Top_100_Liked_Questions #String #Stack #Recursion #Level_1_Day_14_Stack #Udemy_Strings
// #Big_O_Time_O(n)_Space_O(n) #2024_03_16_Time_1_ms_(76.33%)_Space_2.2_MB_(26.06%)

import (
	"strings"
)

type Decoder struct {
	s string
	i int
}

func (d *Decoder) decodeString(s string) string {
	d.s = s
	return d.decode()
}

func (d *Decoder) decode() string {
	count := 0
	var sb strings.Builder

	for d.i < len(d.s) {
		c := d.s[d.i]
		d.i++

		if isLetter(c) {
			sb.WriteByte(c)
		} else if isDigit(c) {
			count = count*10 + int(c-'0')
		} else if c == ']' {
			break
		} else if c == '[' {
			// subproblem
			repeat := d.decode()
			for count > 0 {
				sb.WriteString(repeat)
				count--
			}
		}
	}

	return sb.String()
}

func isLetter(c byte) bool {
	return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')
}

func isDigit(c byte) bool {
	return c >= '0' && c <= '9'
}

func decodeString(s string) string {
	d := Decoder{}
	return d.decodeString(s)
}
