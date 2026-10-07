class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.155229.319ec61"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-155229-319ec61/marvel-darwin-arm64"
    sha256 "774b6e51edd2ed6175d57bb799f09ace652e1f22467903e475920115ba1a5e7f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-155229-319ec61/marvel-darwin-amd64"
    sha256 "b775bb331d187b177fd06296a72ba5586fc3dc05c4273ad6b75f7be17ef4a10f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-155229-319ec61/marvel-linux-arm64"
    sha256 "120fe52d60ed3c4a09132b8b07f1922534fae0a5cf170f9b9362dd52b4e7adfc"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-155229-319ec61/marvel-linux-amd64"
    sha256 "cbebd012b1de9ce3f9678fd70c96b360ccdbf7db5304bd7055bceef8c1ac183a"
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
