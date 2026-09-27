class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260927.181516.b50d962"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260927-181516-b50d962/marvel-darwin-arm64"
    sha256 "cccf78e5d1225eaf6db212c0f299321c04108fae3ab1cedabb6aafa0717e716a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260927-181516-b50d962/marvel-darwin-amd64"
    sha256 "04fef3ab1e9df5dc65399e69a47f5556166b3686ef43106b29a3bf0c19f7d4cc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260927-181516-b50d962/marvel-linux-arm64"
    sha256 "b3d57bf49a3c164c5ed1e1752ba1723e9307a33cd56c41f25a9448fd736a0ca2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260927-181516-b50d962/marvel-linux-amd64"
    sha256 "0d8865ce24d6aa12e2816d5a3bfd95a313c40f33e3748aa0270689cb61cd3f0d"
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
