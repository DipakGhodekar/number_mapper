# Number to Word Combination(s)

Its easy to remember words, than large number. number-to-word-combination provides all possible words as per letter to digit mapping. You can choose word which is easier to remember.

e.g.
Consider folloing letters mapping,
```
    2 = A B C
    3 = D E F
```
Now, Instead of remembering number 233, "ADD" or "BED" word is easier to remeber.
Word can be retrived as follows from number.
```
    B = 2
    E = 3
    D = 3
```
```
    A = 2
    D = 3
    D = 3
```



## Basic Usage

1. Run bundle install
```
bundle install
```
2. Execute programme as terminal command.
```
bundle exec ruby number_to_word_combinations.rb 6686787825
```
This will give possible combinations of words with benchmark.

3. Execute programme from console, use following steps,

4. Start Ruby Console.
```
bin/console

```
5. Create instance of NumberMapper with number parameter.
Call instance method ```NumberMapper#search_word_combinations``` on this instance.
This will give all possible combinations of words for the given number.
```
    NumberMapper.new(number: 6686787825).search_word_combinations
    # => [
    #      "MOTORTRUCK",
    #      "MOTOR,TRUCK",
    #      "MOTOR,USUAL",
    #      "MOT,OPTS,TAJ",
    #      "MOT,OPT,PUCK",
    #      "MOT,OPT,RUCK",
    #      "MOT,OPT,SUCK",
    #      "MOT,OPUS,TAJ",
    #      "MOT,ORTS,TAJ",
    #      "MOT,ORT,PUCK",
    #      "MOT,ORT,RUCK",
    #      "MOT,ORT,SUCK",
    #      "NOT,OPTS,TAJ",
    #      "NOT,OPT,PUCK",
    #      "NOT,OPT,RUCK",
    #      "NOT,OPT,SUCK",
    #      "NOT,OPUS,TAJ",
    #      "NOT,ORTS,TAJ",
    #      "NOT,ORT,PUCK",
    #      "NOT,ORT,RUCK",
    #      "NOT,ORT,SUCK",
    #      "NOUNS,TRUCK",
    #      "NOUNS,USUAL",
    #      "NOUN,PUP,TAJ",
    #      "NOUN,PUR,TAJ",
    #      "NOUN,PUS,TAJ",
    #      "NOUN,STRUCK",
    #      "NOUN,SUP,TAJ",
    #      "NOUN,SUQ,TAJ",
    #      "ONTO,PUP,TAJ",
    #      "ONTO,PUR,TAJ",
    #      "ONTO,PUS,TAJ",
    #      "ONTO,STRUCK",
    #      "ONTO,SUP,TAJ",
    #      "ONTO,SUQ,TAJ",
    #      "OOT,OPTS,TAJ",
    #      "OOT,OPT,PUCK",
    #      "OOT,OPT,RUCK",
    #      "OOT,OPT,SUCK",
    #      "OOT,OPUS,TAJ",
    #      "OOT,ORTS,TAJ",
    #      "OOT,ORT,PUCK",
    #      "OOT,ORT,RUCK",
    #      "OOT,ORT,SUCK"
    #    ]
```

## Digit to Alphabet Mapping

Each digit is mapped with set of Alphabets. This mapping can be override by changing combination in digit_mapping.ym file.

#### Default Mapping

```
    2 = A B C
    3 = D E F
    4 = G H I
    5 = J K L
    6 = M N O
    7 = P Q R S
    8 = T U V
    9 = W X Y Z
```

## Dictionary
dictionary.txt is used as words dictionary. Words can be added or removed from this dictionary.txt file as per preference.

## Benchmark

```
Benchmark.bm do |x|
  x.report { NumberMapper.new(number: 6686787825).search_word_combinations }
end
#       user     system      total        real
#   0.509622   0.004365   0.513987 (  0.514006)
# => [#<Benchmark::Tms:0x00000000033b6318 @label="", @real=0.5140061420006532, @cstime=0.0, @cutime=0.0, @stime=0.004365000000000001, @utime=0.509622, @total=0.513987>] 

```

## Specs

Execute spec with following commands

```
bundle exec rspec spec/number_mapper_spec.rb -f d
```
