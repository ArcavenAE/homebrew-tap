class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261128.004906.b379ca6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-004906-b379ca6/marvel-darwin-arm64"
    sha256 "5a5bdc6029962ee5a1ae82924a7464a5402a0566710b52ed55c9fe0dac687ec2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-004906-b379ca6/marvel-darwin-amd64"
    sha256 "7bdbb2082361982fc8f60b5ada10ba1ffb9619a520a9faf9c663456405bfdf0f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-004906-b379ca6/marvel-linux-arm64"
    sha256 "2adba6bff7ccea28896866df04642305dfd6c77e4d0c2d1c43188757cecbf2b6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-004906-b379ca6/marvel-linux-amd64"
    sha256 "5b08535e2984c21f3bbe035ef22696aa7cd87d3029deeb4361d598fa5e1dfd7c"
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
