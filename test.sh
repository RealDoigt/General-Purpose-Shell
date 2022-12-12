#!/Documents/GitHub/General-Purpose-Shell/gps

term;

each (arg, args)
{
    out arg;
}

str hello = 'hello world';
out hello;

if (hello[0] == 'h')
    out 'this thing works';

smol int my_num = 100 ?+ '10';
flt my_other_num ?= '0.1';
big flt my_other_other_num = .;
var my_variant_float = .55;
var my_other_variant_float = 55.;
str tab = '\t';

var age;

til (age is unt)
{
    out 'what is your age?';
    in age;
}

bin is_child = age <= 12;
str term = !is_child ? age < 18 ? 'adolescent', 'adult', 'infant';
