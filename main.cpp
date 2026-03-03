
#include <cstdlib>
#include <filesystem>
#include <format>
#include <iostream>
#include <string>

int main(int argc, char **argv) {
#ifdef _WIN32
#error "Windows is not supported"
#endif

  std::filesystem::path repo_dir = std::getenv("HOME");
  repo_dir /= ".local/state/playfulconfig/";
  if (!std::filesystem::exists(repo_dir))
  {
    std::system(
        std::format("git clone {} {}",
                    "https://github.com/playfulmathematician/configuration.git",
                    repo_dir.c_str())
            .c_str());
  }
  


}
