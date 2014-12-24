define test ($specialcharacter) {
  concat { "test${specialcharacter}":
    ensure => present,
    path   => "/tmp/special-filename-${specialcharacter}${specialcharacter}${specialcharacter}",
    owner  => 'root',
    group  => 'root',
    mode   => '0664',
  }
  concat::fragment { "1${specialcharacter}":
    target  => "test${specialcharacter}",
    content => "1 ",
    order   => '01',
  }
  concat::fragment { "2${specialcharacter}":
    target  => "test${specialcharacter}",
    content => "2",
    order   => '02',
  }
}

# Define files with special characters in their names.
test { 'question mark': specialcharacter => '?' }
test { 'asterisk': specialcharacter => '*' }
test { 'newline': specialcharacter => "\n" }
test { 'single quote': specialcharacter => "'" }
test { 'double quote': specialcharacter => "\"" }
test { 'space': specialcharacter => ' ' }
