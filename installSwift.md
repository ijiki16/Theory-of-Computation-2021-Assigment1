# Install Swift on Ubuntu 20.04

## დააყენეთ საჭირო დამოკიდებულებები:

```bash
$ apt-get install \
    binutils \
    git \
    gnupg2 \
    libc6-dev \
    libcurl4 \
    libedit2 \
    libgcc-9-dev \
    libpython2.7 \
    libsqlite3-0 \
    libstdc++-9-dev \
    libxml2 \
    libz3-dev \
    pkg-config \
    tzdata \
    zlib1g-dev
```

## გასმოწერეთ ზიპი შესაბამისი საიტიდან

<https://swift.org/download/#releases>

ამოაარქივეთ და ფოლდერი შეინახეთ ქვენთის სასურველ ადგილას.

## დაამატეთ swift ტერმინალის პროგრამებში 

შემდეგ თუ გინდა რომ ტერმინლიდან გამოიყენოთ Swift გაუშვით ეს კომანდი
სადაც '/path/to/Swift' ჩაანაცვლებთ ქვენი ფოლდერის მისამართით

```bash
$ export PATH=/path/to/Swift/usr/bin:"${PATH}"
```
