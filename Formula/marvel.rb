class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.194435.d0a492c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-194435-d0a492c/marvel-darwin-arm64"
    sha256 "ee4b15b76bf1ad9c3f65051b57084ff102fd00b5f60c08a5dfcb1195efc47397"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-194435-d0a492c/marvel-darwin-amd64"
    sha256 "8d6276ac26a77f936020556b49dd56c6cfa4829a684e1a83b41654f7a8377ec6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-194435-d0a492c/marvel-linux-arm64"
    sha256 "56c835237d2eff71b3fd713747037448cbca5dd8b8e156b7fea220c017d2336d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-194435-d0a492c/marvel-linux-amd64"
    sha256 "9b1c22ae7988bde52684f84b5ffbb42b683c72abaa6279f15dd0ffbba49be409"
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
