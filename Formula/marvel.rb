class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261014.164610.7e59f50"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-164610-7e59f50/marvel-darwin-arm64"
    sha256 "99a9f3ff6149c03316122e0c4fcf5200e6149a60ff12747b59487b63e90328f3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-164610-7e59f50/marvel-darwin-amd64"
    sha256 "9f474009f9609123225832aad92a62abdaafb40ee42f1e07da82330cc7a17f86"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-164610-7e59f50/marvel-linux-arm64"
    sha256 "8e220c0e4fb51e2d075f62f1f329618dae24ce60bec5c036cb7c1d8de9ea72d9"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-164610-7e59f50/marvel-linux-amd64"
    sha256 "ab8762f98b332c375cb9ecb6f535c5b842a0697ed60cafcf686b3bfcd7cf9c00"
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
