class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261123.020719.f92616e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-020719-f92616e/marvel-darwin-arm64"
    sha256 "4b9829d6a1335b54771b1867680681b0757aa7d05e2c1dac4f4adabfc316486f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-020719-f92616e/marvel-darwin-amd64"
    sha256 "a28526e37669d5a718d5632bb33d2d895909cfbb062bac1914139649ffdbb395"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-020719-f92616e/marvel-linux-arm64"
    sha256 "6f8312739db1462f1abd3a0b3bce71055fe8e1afa8ab6e7a24590b36449b0e81"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-020719-f92616e/marvel-linux-amd64"
    sha256 "036037e767fe0a2a2b71c4e584492b4c8c8f69966fe40e4a5cd216a2c571ea5e"
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
