class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.141942.2f05ac7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-141942-2f05ac7/marvel-darwin-arm64"
    sha256 "c23bbbecc5183aacbf7019e2da89b135b91d0c5ecd2e7a8878447994a4f5b8c0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-141942-2f05ac7/marvel-darwin-amd64"
    sha256 "98c6c5f00ea088bb0575704666af36ca28999a31779358819a3586b090ef2238"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-141942-2f05ac7/marvel-linux-arm64"
    sha256 "3de252a4281c3acea34fc0f1e100c362fef292b65ff76549e3c02f431f6a6cd5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-141942-2f05ac7/marvel-linux-amd64"
    sha256 "0f63d26c95d1d813a98aca1c1328a38a8918166b81481d20ef058d034b1de1d4"
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
