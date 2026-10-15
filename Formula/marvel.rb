class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261015.190006.d266030"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-190006-d266030/marvel-darwin-arm64"
    sha256 "b9f902f1d74814baa994bb9a6e71a2268cd26c6c5d115ce361f7a4d10933abcf"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-190006-d266030/marvel-darwin-amd64"
    sha256 "6869fa1c2fae0033a5ede2a277399711d94f9ac65516bea4ba9d870a6a91533c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-190006-d266030/marvel-linux-arm64"
    sha256 "0e2e323835141d21eb4f9ea7f7a2213fa5f8f0dbdf94ae6a64a23f942dff3d13"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-190006-d266030/marvel-linux-amd64"
    sha256 "07f6f95acbb64fa6c3ea3855dcf8abec9cbbb77e4d60eaa437fdc333be93167d"
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
