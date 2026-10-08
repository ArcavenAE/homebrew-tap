class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.041714.644b155"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-041714-644b155/sideshow-darwin-arm64"
    sha256 "7187ff5754a015afd4742604b3ceea14c1939eba5bb534c24fa86410f4c3be92"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-041714-644b155/sideshow-darwin-amd64"
    sha256 "b27cf40e743caf480968052528bf27e2ae9c4a51715c4d71eedc19eb96c66776"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-041714-644b155/sideshow-linux-amd64"
    sha256 "8ab67417c8cbac131a7f3529e8be739c5e1a9b22d2416f08ee0b32bc03296ffc"
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
