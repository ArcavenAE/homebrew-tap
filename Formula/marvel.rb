class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261010.134351.ab96387"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-134351-ab96387/marvel-darwin-arm64"
    sha256 "4738350283c33120c657f723dcf830fcb633252b48028fbfe436e224fdb73bee"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-134351-ab96387/marvel-darwin-amd64"
    sha256 "189bbf603ba411bce5b0df11b4ef811b89380d491d227ce435034ff9ce9c60dc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-134351-ab96387/marvel-linux-arm64"
    sha256 "5f97e42e645cd70d94237e46916a3f9f83999b3a28618867ddf6dbf9806856f7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-134351-ab96387/marvel-linux-amd64"
    sha256 "aa1e53c3e6d9a128a6a44212516647779780cba2a34a92880f2f7be3fa7d0443"
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
