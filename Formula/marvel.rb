class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.063532.3ddef96"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-063532-3ddef96/marvel-darwin-arm64"
    sha256 "795dfec7df042c7d9a55659532f932c9071e053e6aac184f84c59d6b89e3fdc9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-063532-3ddef96/marvel-darwin-amd64"
    sha256 "5d1f6e1694cc3e222e7e69767c292d9a8c4e420d8433eb1c553959d91d15651e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-063532-3ddef96/marvel-linux-arm64"
    sha256 "b3bbe05da452499e5939956472c653a46916ec1d24b33ff34852095d60b70701"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-063532-3ddef96/marvel-linux-amd64"
    sha256 "aa9bfcc6efec796c060fb77731792d4756b6286088af7bb7a0afdc445dbe4991"
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
