class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261002.125235.c206f40"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261002-125235-c206f40/sideshow-darwin-arm64"
    sha256 "4cceadb4ce1f3e6ba3fe5181c79c8093a4b9ab02a9d1082661dd1c52782f05bd"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261002-125235-c206f40/sideshow-darwin-amd64"
    sha256 "69e4cae9e317935c9da455d434137c8a04aa9fc29de680803be0f4837a671622"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261002-125235-c206f40/sideshow-linux-amd64"
    sha256 "661e993fe2f8b42398dc8caf24a9a331390ea6ac5725e16bfdd6eddae95e1b44"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end
