class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.020405.42a7ddb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-020405-42a7ddb/marvel-darwin-arm64"
    sha256 "cbbee0fd8d638a4ef9734dc8fe116d30e05ba572a138f7c1927e8a16c781115f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-020405-42a7ddb/marvel-darwin-amd64"
    sha256 "20a6372856021bde944c9c8f033cb84bca9bd993719daa655ac06172ff8e4ea3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-020405-42a7ddb/marvel-linux-arm64"
    sha256 "d57605de5cf3e483528a429b0f4ffa3f43f2fd80a9c738bff96c4e66237a1335"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-020405-42a7ddb/marvel-linux-amd64"
    sha256 "96fb0c4c9a8fff72f20a17a2dc8cd1f76e9fd73203a889b1e76e71cfdc501656"
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
