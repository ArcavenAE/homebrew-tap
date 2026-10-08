class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.011940.fdddf09"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-011940-fdddf09/marvel-darwin-arm64"
    sha256 "55f109bf6ee17a312695202450df876bc4d44d4a17f8824f22a930ad5910ce3a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-011940-fdddf09/marvel-darwin-amd64"
    sha256 "e6c45a3506c789ce3709e0c838c6bc2605427627e2258a409414bbddefb68386"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-011940-fdddf09/marvel-linux-arm64"
    sha256 "97a6129984222b86dd0b031655c91373b93b851e20a5d787ade3000da6924f08"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-011940-fdddf09/marvel-linux-amd64"
    sha256 "2e21ed365a6b4829e3a22c61e6b5a6f017b355cd5904b18daef85ff692740dfa"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
