
#include <climits>
#include <cstdlib>
#include <filesystem>
#include <format>
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
typedef struct {
  std::string name;
  std::vector<std::pair<std::string, std::string>> entries;
} AppEntry;

typedef enum {
  LPAR,
  RPAR,
  WORD
} TokenType;

typedef struct {
  TokenType tt;
  std::string contents;
  int level;
} Token;  

typedef std::vector<AppEntry> Manifestation;
int main(int argc, char **argv) {

  std::filesystem::path repo_dir = std::getenv("HOME");
  repo_dir /= ".local/state/playfulconfig/";
  if (!std::filesystem::exists(repo_dir)) {
    std::cout << "Cloning Repository" << std::endl;
    std::system(
        std::format("git clone {} {}",
                    "https://github.com/playfulmathematician/configuration.git",
                    repo_dir.c_str())
            .c_str());
  } else {
    std::cout << "Pulling Repo Updates" << std::endl;
    std::system(std::format("git -C  {} pull", repo_dir.c_str()).c_str());
  }

  std::filesystem::path manifest_file = repo_dir;
  manifest_file /= "MANIFEST";


  std::ifstream f(manifest_file.c_str());
  char ch;
  std::string current;
  std::vector<Token> tokens;
  Token t;
  t.level = 0;

  while (f.get(ch)) {
    if (std::isspace(static_cast<unsigned char>(ch))) {
      if (!current.empty()) {
        t.contents = current;
        t.tt = WORD;
        tokens.push_back(t);
                current.clear();
            }
            continue;
    }
    if (ch == '(' || ch == ')') {
      if (!current.empty()) {
          t.contents = current;
          t.tt = WORD;
         tokens.push_back(t);
                current.clear();
      }
      if (ch == ')') {
        t.tt = RPAR;
        t.level--;
        tokens.push_back(t);
 
      } else {
        t.tt = LPAR;

        tokens.push_back(t);
        t.level++;
      }
            continue;
        }
        current += ch;
  }
  for (Token tok : tokens) {
    std::cout << std::string(tok.level, '\t');
    switch (tok.tt) {
      
    case LPAR:
      std::cout << "(" << std::endl;
      break;
    case RPAR:
      std::cout << ")" << std::endl;
      break;
    case WORD:
      std::cout << tok.contents << std::endl;
      break;
    }
      
  }
  

  }

 
