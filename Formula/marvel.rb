class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260908.194332.c7cc1ad"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260908-194332-c7cc1ad/marvel-darwin-arm64"
    sha256 "0c066364f23a7ab2f0b7691847bcbc3f1aad5642b41e3234e05f732cba2fbc74"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260908-194332-c7cc1ad/marvel-darwin-amd64"
    sha256 "fdab85fac9d543cfd74f6a03f464319341cab349cde3ad44f39b66027db1d550"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260908-194332-c7cc1ad/marvel-linux-arm64"
    sha256 "3ed6ece582cb48cfa90bdeb114f29f10177f3872e92d8012b1cac08a8749b7b1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260908-194332-c7cc1ad/marvel-linux-amd64"
    sha256 "5f6eb544cffde4181eac22eaeec5f123537a8d657e1e42af96a1275daabcdf93"
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
