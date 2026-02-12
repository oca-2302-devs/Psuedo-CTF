#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
  execl("/bin/cat", "cat", "/root/flag.txt", NULL);
  return 0;
}
