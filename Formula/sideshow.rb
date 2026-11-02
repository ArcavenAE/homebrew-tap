class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261102.012108.56c8433"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261102-012108-56c8433/sideshow-darwin-arm64"
    sha256 "1176fbec45811191979d08c8310e351a960d948af5a6c3df7d094fa6bf70c90f"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261102-012108-56c8433/sideshow-darwin-amd64"
    sha256 "562ecf5c8cfef7f0c0e64c75405b27acea255dfb4247c2c6421e2380288d140b"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261102-012108-56c8433/sideshow-linux-amd64"
    sha256 "2048789e7427b147ac1805ca70197795494fcad373c2f2dccd78963831e6a89d"
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
